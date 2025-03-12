# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "25.1.1"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.1.1.darwin-10.9-amd64.tgz"
      sha256 "6df02cc5732db3c15e5e7aa591feb66a4fe7b07ee08eb6dd978431ef2de9223b"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.1.1.darwin-11.0-arm64.tgz"
      sha256 "0cd58fe22a5078df40bec10086b54f2fbb42720af2eef27949c33bcd992dbd94"
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
    assert_match "25.1.1", output
  end

end

