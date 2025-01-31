# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "24.3.4"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.3.4.darwin-10.9-amd64.tgz"
      sha256 "3a7e04ab4549b34e5c75dbf2d8f31f887ae0d8e3defd4a694f2fced36925bbb6"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.3.4.darwin-11.0-arm64.tgz"
      sha256 "c417c2c31f85c2267d82f2861029524bc5dbe80e3a7564eda88aaedbf9537ba6"
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
    assert_match "24.3.4", output
  end

end

