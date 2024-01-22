# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "23.1.14"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.14.darwin-10.9-amd64.tgz"
      sha256 "6fa98419a90a9d18102021ca544c5f2db8869139d02e97a77016f14074081fac"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.14.darwin-11.0-arm64.tgz"
      sha256 "144fc4d793dd23fd7023387fd66f1cc6c9164ce2c7c5f8bb73d8df7751bd7f83"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "23.1.14", output
  end

end

