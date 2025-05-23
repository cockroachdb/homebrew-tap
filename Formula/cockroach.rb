# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-tmpl.rb

class Cockroach < Formula
  desc "Distributed SQL database"
  homepage "https://www.cockroachlabs.com"
  version "25.2.0"
  on_linux do
    depends_on "patchelf" => :install
  end

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-v25.2.0.darwin-10.9-amd64.tgz"
      sha256 "a198e80fd091da27bdaf6702a54f2e46d0b02bd406e90b32b4a7deb512acbe6a"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-v25.2.0.darwin-11.0-arm64.tgz"
      sha256 "872351e39c9b4bbff335826ec8fa481ef1ea896c99c27f25112e5d7e2d913101"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-v25.2.0.linux-amd64.tgz"
      sha256 "4e895def9fe3f39309701241b9c4a74d05928fb108bd4585ce13dcecfdd028df"
    end
  end

  def install
    bin.install "cockroach"
    prefix.install "LICENSE" if File.exist?("LICENSE")
    prefix.install "LICENSE.txt" if File.exist?("LICENSE.txt")
    prefix.install "THIRD-PARTY-NOTICES.txt"
    if OS.mac?
      if Hardware::CPU.intel?
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

    system "#{bin}/cockroach", "gen", "man", "--path=#{man1}"

    bash_completion.mkpath
    system "#{bin}/cockroach", "gen", "autocomplete", "bash", "--out=#{bash_completion}/cockroach"

    zsh_completion.mkpath
    system "#{bin}/cockroach", "gen", "autocomplete", "zsh", "--out=#{zsh_completion}/_cockroach"
  end

  service do
    args = [
      "start-single-node",
      "--store=#{var}/cockroach",
      "--http-port=26256",
      "--insecure",
      "--host=localhost",
     ]
    unless OS.mac? && Hardware::CPU.arm?
      args << "--spatial-libs=#{opt_bin}/../lib/cockroach"
    end
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
      unless OS.mac? && Hardware::CPU.arm?
        args << "--spatial-libs=#{opt_bin}/../lib/cockroach"
      end
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
      unless OS.mac? && Hardware::CPU.arm?
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
