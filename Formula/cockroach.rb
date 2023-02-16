# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-tmpl.rb

class Cockroach < Formula
  desc "Distributed SQL database"
  homepage "https://www.cockroachlabs.com"
  version "22.2.3"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-v22.2.3.darwin-10.9-amd64.tgz"
      sha256 "6df8416f1c9d6638d55d23e541f17d1bb38c03415313a43e1bb50ceb058996f1"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-v22.2.3.darwin-11.0-arm64.tgz"
      sha256 "66ef3926143856f6e53525c932e635c84d803814ebbfdba222bc2d7afaa3d910"
    end
  end

  def install
    bin.install "cockroach"
    on_intel do
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
        "@rpath/libgeos.3.8.1.dylib", "#{lib}/cockroach/libgeos.dylib",
        "#{lib}/cockroach/libgeos_c.dylib"
    end

    system "#{bin}/cockroach", "gen", "man", "--path=#{man1}"

    bash_completion.mkpath
    system "#{bin}/cockroach", "gen", "autocomplete", "bash", "--out=#{bash_completion}/cockroach"

    zsh_completion.mkpath
    system "#{bin}/cockroach", "gen", "autocomplete", "zsh", "--out=#{zsh_completion}/_cockroach"
  end

  def caveats; <<~EOS
    For local development only, this formula ships a launchd configuration to
    start a single-node cluster that stores its data under:
      #{var}/cockroach/
    Instead of the default port of 8080, the node serves its admin UI at:
      #{Formatter.url("http://localhost:26256")}

    Do NOT use this cluster to store data you care about; it runs in insecure
    mode and may expose data publicly in e.g. a DNS rebinding attack. To run
    CockroachDB securely, please see:
      #{Formatter.url("https://www.cockroachlabs.com/docs/stable/secure-a-cluster.html")}
  EOS
  end

  service do
    run [bin/"cockroach", "start-single-node", "--insecure", "--http-port=26256", "--host=localhost"]
    keep_alive true
    working_dir var
  end
  
  test do
    begin
      # Redirect stdout and stderr to a file, or else  `brew test --verbose`
      # will hang forever as it waits for stdout and stderr to close.
      pid = fork do
        exec "#{bin}/cockroach start-single-node --insecure --background --listen-addr=127.0.0.1:0 --http-addr=127.0.0.1:0 --listening-url-file=listen_url_fifo&> start.out"
      end
      sleep 2

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
      output = pipe_output("#{bin}/cockroach sql --url=$XCOCKROACH_URL --format=csv",
        "SELECT ST_IsValid(ST_MakePoint(1, 1)) is_valid;")
      assert_equal <<~EOS, output
        is_valid
        true
      EOS
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

