# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "24.3.6"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.3.6.darwin-10.9-amd64.tgz"
      sha256 "bc812d9c4394c5c1ba6a70d5601d1d13c2a3a36eaa2485106d937f1705be0996"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.3.6.darwin-11.0-arm64.tgz"
      sha256 "a4c0c6380822c47fa2a0e60ca29b98800d1438797e9cfcf5de0cd8ede541e350"
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
    assert_match "24.3.6", output
  end

end

