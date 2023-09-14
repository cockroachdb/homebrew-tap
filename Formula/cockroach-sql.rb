# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "23.1.10"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.10.darwin-10.9-amd64.tgz"
      sha256 "0d430be407e4082664f73f4532a0a36d1cfc374f2b3ddcd3a452594546a5e0c3"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.10.darwin-11.0-arm64.tgz"
      sha256 "42122f6081fd8bb1de1591d7a4b932b22b4dcb7c471bd096dae2a032bf8a5ab9"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "23.1.10", output
  end

end

