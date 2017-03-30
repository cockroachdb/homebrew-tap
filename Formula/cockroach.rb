class Cockroach < Formula
  desc "Distributed SQL database"
  homepage "https://www.cockroachlabs.com"
  version "beta-20170330"
  url "https://binaries.cockroachdb.com/cockroach-beta-20170330.src.tgz"
  sha256 "578335950bd22b773f91cf8a30ebd8aa3906e8970c903aa1b04c737b2109a442"
  head "https://github.com/cockroachdb/cockroach.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    system "make", "install"
    bin.install "bin/cockroach" => "cockroach"

    # TODO(pmattis): Debug the launchctl stuff
    # (prefix+'com.cockroachlabs.cockroachdb.plist').write startup_plist
    # (prefix+'com.cockroachlabs.cockroachdb.plist').chmod 0644
  end

  def caveats
    <<-EOS.undent
    Start the cockroach server:
        cockroach start --store=#{var}/cockroach
    EOS
  end

  test do
    begin
      system "#{bin}/cockroach", "start", "--background"
      pipe_output("#{bin}/cockroach sql", <<-EOS.undent)
        CREATE DATABASE bank;
        CREATE TABLE bank.accounts (id INT PRIMARY KEY, balance DECIMAL);
        INSERT INTO bank.accounts VALUES (1, 1000.50);
      EOS
      output = pipe_output("#{bin}/cockroach sql --format=csv",
        "SELECT * FROM bank.accounts;")
      assert_equal <<-EOS.undent, output
        1 row
        id,balance
        1,1000.50
      EOS
    ensure
      system "#{bin}/cockroach", "quit"
    end
  end

  #   def startup_plist
  #     return <<-EOS
  # <?xml version="1.0" encoding="UTF-8"?>
  # <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
  # <plist version="1.0">
  # <dict>
  #   <key>Label</key>
  #   <string>com.cockroachlabs.cockroachdb</string>
  #   <key>ProgramArguments</key>
  #   <array>
  #     <string>#{bin}/cockroach</string>
  #     <string>start</string>
  #   </array>
  #   <key>RunAtLoad</key>
  #   <true/>
  #   <key>KeepAlive</key>
  #   <false/>
  #   <key>UserName</key>
  #   <string>#{`whoami`.chomp}</string>
  #   <key>WorkingDirectory</key>
  #   <string>#{HOMEBREW_PREFIX}</string>
  #   <key>StandardErrorPath</key>
  #   <string>#{var}/log/cockroachdb/output.log</string>
  #   <key>StandardOutPath</key>
  #   <string>#{var}/log/cockroachdb/output.log</string>
  # </dict>
  # </plist>
  # EOS
  #   end
end
