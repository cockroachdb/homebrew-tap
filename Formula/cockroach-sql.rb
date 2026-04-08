# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "26.1.2"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.1.2.darwin-10.9-amd64.tgz"
      sha256 "5353424f67b4bd0ba2fec8fa949be326009f2b37c1df29b191555e4dd9aa6f9f"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.1.2.darwin-11.0-arm64.tgz"
      sha256 "54c4be772e45636e87443745f45572377e854733187ea5d58f836bbd503e5eb4"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.1.2.linux-amd64.tgz"
      sha256 "7411f964448269ca95285a8fff2f34df7343f871ba1a6c179e0dc75d4930b2e7"
    end
  end

  def install
    bin.install "cockroach-sql"
    prefix.install "LICENSE" if File.exist?("LICENSE")
    prefix.install "LICENSE.txt" if File.exist?("LICENSE.txt")
    prefix.install "THIRD-PARTY-NOTICES.txt"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version")
    assert_match "26.1.2", output
  end
end
