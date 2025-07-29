# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-tmpl.rb

class CockroachAT243 < Formula
  desc "Distributed SQL database"
  homepage "https://www.cockroachlabs.com"
  version "24.3.16"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-v24.3.16.darwin-10.9-amd64.tgz"
      sha256 "8dc236dcbf61a8f62b532b78a75fe4dc0c68ef3a73117edc55d490d1267cfeda"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-v24.3.16.darwin-11.0-arm64.tgz"
      sha256 "2a296591b34ec8bc7443c7a611099a696395aa8fecffa181ab15a2906c608e9d"
    end
  end
  on_linux do
    depends_on "patchelf" => :install
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-v24.3.16.linux-amd64.tgz"
      sha256 "0176d470479d0305f9fb23e1bc4b38dd6723b0c549dfabe4174b804e21f39929"
    end
  end

  def libgeos_supported?
    !(OS.mac? && Hardware::CPU.arm?)
  end

  def install
    bin.install "cockroach"
    prefix.install "LICENSE" if File.exist?("LICENSE")
    prefix.install "LICENSE.txt" if File.exist?("LICENSE.txt")
    prefix.install "THIRD-PARTY-NOTICES.txt"
    if OS.mac? && libgeos_supported?
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
      if version < Version.new("23.2.0")
        system "install_name_tool", "-change",
          "@rpath/libgeos.3.8.1.dylib", "#{lib}/cockroach/libgeos.dylib",
          "#{lib}/cockroach/libgeos_c.dylib"
      else
        system "install_name_tool", "-change",
          "@rpath/libgeos.3.11.2.dylib", "#{lib}/cockroach/libgeos.dylib",
          "#{lib}/cockroach/libgeos_c.dylib"
      end
    end

    if OS.linux?
      lib.mkpath
      mkdir "#{lib}/cockroach"
      lib.install "lib/libgeos.so" => "cockroach/libgeos.so"
      lib.install "lib/libgeos_c.so" => "cockroach/libgeos_c.so"
      system "patchelf", "--set-rpath", "#{lib}/cockroach/", "#{lib}/cockroach/libgeos.so"
      system "patchelf", "--set-rpath", "#{lib}/cockroach/", "#{lib}/cockroach/libgeos_c.so"
      system "patchelf", "--set-soname", "libgeos.so", "#{lib}/cockroach/libgeos.so"
      if version < Version.new("23.2.0")
        system "patchelf", "--replace-needed", "libgeos.so.3.8.1", "libgeos.so", "#{lib}/cockroach/libgeos_c.so"
      else
        system "patchelf", "--replace-needed", "libgeos.so.3.11.2", "libgeos.so", "#{lib}/cockroach/libgeos_c.so"
      end
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
