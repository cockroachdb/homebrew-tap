# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "23.1.11"
  on_linux do
    url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.11.linux-amd64.tgz"
    sha256 "8a42076aa8d4448820eb47d9816d08f110d830b263e7edfab1e57f354e6817bb"
  end
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.11.darwin-10.9-amd64.tgz"
      sha256 "444cbeb24b72da5e7da7b1c98cb17943fc509af1806b151713b8c7eb14bd225c"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.11.darwin-11.0-arm64.tgz"
      sha256 "3608433f511fca35558d1192cb8b911918e7a470b72a8efd13f15cec13869662"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "23.1.11", output
  end

end

