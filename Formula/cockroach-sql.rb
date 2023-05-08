# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "22.2.9"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v22.2.9.darwin-10.9-amd64.tgz"
      sha256 "6ef9f552164f858b1bd47ea18102d4e4ef865c9a1e00f0e8a07821ef61b59b04"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v22.2.9.darwin-11.0-arm64.tgz"
      sha256 "02b6e5f1f5802de97e06b9f57aaa02ef7eead0db18ec14a00f8856212554751c"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "22.2.9", output
  end

end

