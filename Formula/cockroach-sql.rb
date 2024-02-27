# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "23.2.2"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.2.2.darwin-10.9-amd64.tgz"
      sha256 "1920baf6b9d690e263500daab47907489b404f59bbb0ed43fb29df4abc738ecd"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.2.2.darwin-11.0-arm64.tgz"
      sha256 "884fd19f0d3270b0009944d13f605eecae2b45fd782249aff0362eef5d446a3d"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "23.2.2", output
  end

end

