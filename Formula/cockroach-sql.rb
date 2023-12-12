# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "23.1.13"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.13.darwin-10.9-amd64.tgz"
      sha256 "47393f4c018fdb4eb903f97e8656fa2eca64c1d66905750dd15137c41d059525"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.13.darwin-11.0-arm64.tgz"
      sha256 "5c4d4a84751ff40234324cbaf6b7473fb456e70e567b026ecc4bfe44700f99f6"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "23.1.13", output
  end

end

