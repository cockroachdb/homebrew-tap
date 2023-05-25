# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "23.1.2"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.2.darwin-10.9-amd64.tgz"
      sha256 "37bfc55e625c9b5e52eaa1671d903cb3ef57c783587171ff610a8bb4a1b90abb"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.2.darwin-11.0-arm64.tgz"
      sha256 "6047872c8e5cf2d9c70b915b727c82a091aa320e42fa998f12b0dd2d4cfe05f7"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "23.1.2", output
  end

end

