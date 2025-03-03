# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "25.1.0"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.1.0.darwin-10.9-amd64.tgz"
      sha256 "8d36c75fe653f006247d02e60a9f16addfefdec84519aaa14056b7a29182ae4d"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.1.0.darwin-11.0-arm64.tgz"
      sha256 "be3b14217e6a60cc50600cccfdb8b5b18ba61fed9de1b0dcb1a2b825031a41c5"
    end
  end

  def install
    bin.install "cockroach-sql"
    prefix.install "LICENSE" if File.exist?("LICENSE")
    prefix.install "LICENSE.txt" if File.exist?("LICENSE.txt")
    prefix.install "THIRD-PARTY-NOTICES.txt"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "25.1.0", output
  end

end

