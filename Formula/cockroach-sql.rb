# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "25.1.6"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.1.6.darwin-10.9-amd64.tgz"
      sha256 "99057f805a8973038a97a83e129229b48b8405733a4a4645bec2ed3c86f66cbc"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.1.6.darwin-11.0-arm64.tgz"
      sha256 "a3d51926eb2ff06fa72421c6d211aa36acf8c6fd73f0f8fd69a1520543d87da6"
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
    assert_match "25.1.6", output
  end

end

