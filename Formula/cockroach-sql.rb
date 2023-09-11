# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "23.1.8"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.8.darwin-10.9-amd64.tgz"
      sha256 "dca11279173df269491dc0d46a071a1c3289af91b77fd4d3db4dc3adfd6da775"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.8.darwin-11.0-arm64.tgz"
      sha256 "72a75f56067040f9ecc5cf41fb75bfe7632ed302a72ca81aac47e7c55c4e6033"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "23.1.8", output
  end

end

