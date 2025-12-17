# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-tmpl.rb

class Cockroach < Formula
  desc "Distributed SQL database"
  homepage "https://www.cockroachlabs.com"
  version "25.4.2"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-v25.4.2.darwin-10.9-amd64.tgz"
      sha256 "22a50979889dd4a89a1444a2493ee6b3d8e0dbc14fe6ba62a95d27254bc9a908"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-v25.4.2.darwin-11.0-arm64.tgz"
      sha256 "c2b2e525aa103bd29514a0382f6483eb85e1c4156ad21c3372dfe3352e8e402c"
    end
  end
  on_linux do
    depends_on "patchelf" => :install
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-v25.4.2.linux-amd64.tgz"
      sha256 "a3bb6b1c17226062198bda601f42f0ea1e76669dd3bf16c8c0968bb1701bd2e2"
    end
  end

  def libgeos_supported?
    !(OS.mac? && Hardware::CPU.arm?)
  end

  # Extract the libgeos library name from libgeos_c dependencies
  def detect_libgeos_name(libgeos_c_path)
    if OS.mac?
      # Use otool to inspect the dylib dependencies
      output = `otool -L "#{libgeos_c_path}"`.lines
      # Find the line with @rpath/libgeos.*.dylib
      geos_line = output.find { |line| line.include?("@rpath/libgeos.") && !line.include?("libgeos_c") }
      if geos_line
        # Extract just the library name (e.g., "@rpath/libgeos.3.13.1.dylib")
        geos_line.strip.split[0]
      else
        raise "Could not detect libgeos dependency in #{libgeos_c_path}"
      end
    else
      # Use patchelf to inspect the shared library dependencies
      output = `patchelf --print-needed "#{libgeos_c_path}" 2>&1`
      # Find the line with libgeos.so* (but not libgeos_c)
      geos_line = output.lines.find { |line| line.strip.start_with?("libgeos.so") && !line.include?("libgeos_c") }
      if geos_line
        # Extract just the library name (e.g., "libgeos.so" or "libgeos.so.3.11.2")
        geos_line.strip
      else
        raise "Could not detect libgeos dependency in #{libgeos_c_path}. Output: #{output}"
      end
    end
  end

  def install
    bin.install "cockroach"
    prefix.install "LICENSE" if File.exist?("LICENSE")
    prefix.install "LICENSE.txt" if File.exist?("LICENSE.txt")
    prefix.install "THIRD-PARTY-NOTICES.txt"
    if OS.mac? && libgeos_supported?
      # Detect the libgeos version dynamically before modifying the library
      libgeos_name = detect_libgeos_name("lib/libgeos_c.dylib")

      lib.mkpath
      mkdir "#{lib}/cockroach"
      lib.install "lib/libgeos.dylib" => "cockroach/libgeos.dylib"
      lib.install "lib/libgeos_c.dylib" => "cockroach/libgeos_c.dylib"

      # Brew sets rpaths appropriately, but only if the rpaths are set
      # to not include "@rpath". As such, use the #{lib} location for the
      # rpaths.
      system "install_name_tool", "-id",
        "#{lib}/cockroach/libgeos.dylib", "#{lib}/cockroach/libgeos.dylib"
      system "install_name_tool", "-id",
        "#{lib}/cockroach/libgeos_c.1.dylib", "#{lib}/cockroach/libgeos_c.dylib"
      system "install_name_tool", "-change",
        libgeos_name, "#{lib}/cockroach/libgeos.dylib",
        "#{lib}/cockroach/libgeos_c.dylib"
    end

    if OS.linux?
      lib.mkpath
      mkdir "#{lib}/cockroach"
      lib.install "lib/libgeos.so" => "cockroach/libgeos.so"
      lib.install "lib/libgeos_c.so" => "cockroach/libgeos_c.so"

      # Detect the libgeos version dynamically before modifying the library
      libgeos_name = detect_libgeos_name("#{lib}/cockroach/libgeos_c.so")

      system "patchelf", "--set-rpath", "#{lib}/cockroach/", "#{lib}/cockroach/libgeos.so"
      system "patchelf", "--set-rpath", "#{lib}/cockroach/", "#{lib}/cockroach/libgeos_c.so"
      system "patchelf", "--set-soname", "libgeos.so", "#{lib}/cockroach/libgeos.so"
      system "patchelf", "--replace-needed", libgeos_name, "libgeos.so", "#{lib}/cockroach/libgeos_c.so"
    end

    system bin/"cockroach", "gen", "man", "--path=#{man1}"

    bash_completion.mkpath
    system bin/"cockroach", "gen", "autocomplete", "bash", "--out=#{bash_completion}/cockroach"

    zsh_completion.mkpath
    system bin/"cockroach", "gen", "autocomplete", "zsh", "--out=#{zsh_completion}/_cockroach"
  end

  service do
    args = [
      "start-single-node",
      "--store=#{var}/cockroach",
      "--http-port=26256",
      "--insecure",
      "--host=localhost",
    ]
    # We cannot use custom function in the service block, so we need to
    # check the condition here.
    args << "--spatial-libs=#{opt_bin}/../lib/cockroach" if !(OS.mac? && Hardware::CPU.arm?)
    run [opt_bin/"cockroach"] + args
    working_dir var
    keep_alive true
    log_path var/"log/cockroach.log"
    error_log_path var/"log/cockroach.err"
  end

  test do
    begin
      args = [
        "start-single-node",
        "--insecure",
        "--background",
        "--listen-addr=127.0.0.1:0",
        "--http-addr=127.0.0.1:0",
        "--listening-url-file=listen_url_fifo",
      ]
      args << "--spatial-libs=#{opt_bin}/../lib/cockroach" if libgeos_supported?
      # Redirect stdout and stderr to a file, or else  `brew test --verbose`
      # will hang forever as it waits for stdout and stderr to close.
      pid = fork do
        exec "#{bin}/cockroach " + args.join(" ") + " &> start.out"
      end
      sleep 20

      # TODO(bdarnell): remove the X from this variable and the --url flags after
      # https://github.com/cockroachdb/cockroach/issues/40747 is fixed.
      ENV["XCOCKROACH_URL"] = File.read("listen_url_fifo").strip
      pipe_output("#{bin}/cockroach sql --url=$XCOCKROACH_URL", <<~EOS)
        CREATE DATABASE bank;
        CREATE TABLE bank.accounts (id INT PRIMARY KEY, balance DECIMAL);
        INSERT INTO bank.accounts VALUES (1, 1000.50);
      EOS
      output = pipe_output("#{bin}/cockroach sql --url=$XCOCKROACH_URL --format=csv",
        "SELECT * FROM bank.accounts;")
      assert_equal <<~EOS, output
        id,balance
        1,1000.50
      EOS
      if libgeos_supported?
        output = pipe_output("#{bin}/cockroach sql --url=$XCOCKROACH_URL --format=csv",
          "SELECT ST_IsValid(ST_MakePoint(1, 1)) is_valid;")
        assert_equal <<~EOS, output
          is_valid
          t
        EOS
      end
    rescue => e
      # If an error occurs, attempt to print out any messages from the
      # server.
      begin
        $stderr.puts "server messages:", File.read("start.out")
      rescue
        $stderr.puts "unable to load messages from start.out"
      end
      raise e
    ensure
      Process.kill("SIGINT", pid)
      Process.wait(pid)
    end
  end
end
