# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "25.1.3"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.1.3.darwin-10.9-amd64.tgz"
      sha256 "2fb9ab50bdef5fcc854ad6b2dd6c799ad53439d9853892242b54f892065794e3"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.1.3.darwin-11.0-arm64.tgz"
      sha256 "7f4bcfdb6e9dcdaec9ebc61e54fcd51e1204df7216d996022013fa6f25384770"
    end
  end

  def install
    bin.install "cockroach-sql"
    prefix.install "LICENSE" if File.exist?("LICENSE")
    prefix.install "LICENSE.txt" if File.exist?("LICENSE.txt")
    prefix.install "THIRD-PARTY-NOTICES.txt"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "25.1.3", output
  end

end

