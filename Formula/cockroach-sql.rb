# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "25.2.2"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.2.2.darwin-10.9-amd64.tgz"
      sha256 "b92e69741689be00354677589807ab83926f5005139430cbcf61e4b6a818548d"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.2.2.darwin-11.0-arm64.tgz"
      sha256 "c0b7e4bd5144da3334a6098dc5eaae0d9bcfd73962cf71d9f042d585af5fda0b"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.2.2.linux-amd64.tgz"
      sha256 "5e9fcf62ba6ed22dc1bc2a9a42896b0c7bcf7e35d096e1620d5814954c04c7c9"
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
    assert_match "25.2.2", output
  end
end
