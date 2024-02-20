# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "23.2.1"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.2.1.darwin-10.9-amd64.tgz"
      sha256 "c2bbd78ebd42a603827d9bb1cefb810bfc8b9a34f82aac97254fea2adc025b5b"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.2.1.darwin-11.0-arm64.tgz"
      sha256 "c535233d4a62dd68d8bff6335f6a2eefef508777af13f9b41bf74888975bc05f"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "23.2.1", output
  end

end

