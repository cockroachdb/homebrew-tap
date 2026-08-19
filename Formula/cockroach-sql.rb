# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "26.3.0"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.3.0.darwin-10.9-amd64.tgz"
      sha256 "c7e0130a8848a50fd4fe2e867afd6c5aacfc3186957f027816716cddb9225b7a"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.3.0.darwin-11.0-arm64.tgz"
      sha256 "2fa9ee181bbe5a91be1af4bba96826f69467122515be34bcbae330f3d2831fca"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.3.0.linux-amd64.tgz"
      sha256 "d2616e43e26badee22bae8554ce3f64e113f7deb2bd0989e4853a8a93b3334f2"
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
    assert_match "26.3.0", output
  end
end
