# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "24.2.3"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.2.3.darwin-10.9-amd64.tgz"
      sha256 "e85ac10706ef5f8348343a257507801eacb58e72ed96897e171a1e23f8196bd5"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.2.3.darwin-11.0-arm64.tgz"
      sha256 "8bc17ad56a6792eafb5841fd0c562b7327678eab305c05bccb6b54d39b2b21d9"
    end
  end

  def install
    bin.install "cockroach-sql"
    prefix.install "LICENSE.txt", "THIRD-PARTY-NOTICES.txt"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "24.2.3", output
  end

end

