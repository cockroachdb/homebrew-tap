# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "26.2.3"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.2.3.darwin-10.9-amd64.tgz"
      sha256 "2b5b329c8a7cdb40ccf232a123455c5ce51ff464217360853df2fa0494f12ba3"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.2.3.darwin-11.0-arm64.tgz"
      sha256 "a584c3156cf532a559ba2175b2dcea983029470bd2b4b012590d4d5d0a05e04b"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.2.3.linux-amd64.tgz"
      sha256 "b917799627b9da4f21532e248ce7f859c6ede7bbda2777110209d15ae9d7d386"
    end
  end

  def install
    bin.install "cockroach-sql"
    prefix.install "LICENSE" if File.exist?("LICENSE")
    prefix.install "LICENSE.txt" if File.exist?("LICENSE.txt")
    prefix.install "THIRD-PARTY-NOTICES.txt"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version")
    assert_match "26.2.3", output
  end
end
