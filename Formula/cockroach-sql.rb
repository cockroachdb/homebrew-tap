# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "23.1.0"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.0.darwin-10.9-amd64.tgz"
      sha256 "42687b024f6dc0427f4754ce70e8dc7624f38d9e342781f8376722bb94c1da67"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.0.darwin-11.0-arm64.tgz"
      sha256 "85c24b7728fdfab795d6df9703ee81e3824ad473d0b89f5ac428d8ea7d3bfe14"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "23.1.0", output
  end

end

