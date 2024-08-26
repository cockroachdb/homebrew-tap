# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "24.2.0"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.2.0.darwin-10.9-amd64.tgz"
      sha256 "6ac033bb59e696b07d9f9bd4eb1ad283bdb7c5369e17f642984cd8756a540874"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.2.0.darwin-11.0-arm64.tgz"
      sha256 "bd1f694de6a884c48f8999a7ced1712e43ad915693bdc1b502c092021464a252"
    end
  end

  def install
    bin.install "cockroach-sql"
    prefix.install "LICENSE.txt", "THIRD-PARTY-NOTICES.txt"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "24.2.0", output
  end

end

