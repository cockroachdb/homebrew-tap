# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "23.2.5"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.2.5.darwin-10.9-amd64.tgz"
      sha256 "b493a842ee5d62f76e2a2865a2c194b5788c26b9feb8583a5066ae55a083d3a4"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.2.5.darwin-11.0-arm64.tgz"
      sha256 "e63a28b3f4dbd33b882fbc8f3f49e1b9768d7ce5939e2da4c6036941040f8f37"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "23.2.5", output
  end

end

