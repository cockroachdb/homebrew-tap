# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "23.1.7"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.7.darwin-10.9-amd64.tgz"
      sha256 "e2a4a97bcf868988cbc52639c1e2d1d945655c516eb65f3030c51f0ed12791e8"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.7.darwin-11.0-arm64.tgz"
      sha256 "ff02c09eb676dd0466d5f8303064c186bffa35ec26c8307bcfef7bed23119843"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "23.1.7", output
  end

end

