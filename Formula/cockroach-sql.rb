# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "25.2.1"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.2.1.darwin-10.9-amd64.tgz"
      sha256 "c5da567d6c76c80b20b12dd7126c0b8b90a7116d12e9d6b1274fcf75657732d3"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.2.1.darwin-11.0-arm64.tgz"
      sha256 "c38f7756472bd8fdfdd996de1366ddff193de607e13d3e501b654479128e73d0"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.2.1.linux-amd64.tgz"
      sha256 "4b97f796f110141e388d6cf18076312379bec1c687984a2a725590a4b835456b"
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
    assert_match "25.2.1", output
  end
end
