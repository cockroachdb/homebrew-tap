# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "25.1.2"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.1.2.darwin-10.9-amd64.tgz"
      sha256 "8aa948bd9a3d3ce5aa1654b07521a9045fe61f6d1f52c496d5d61daec93ff375"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.1.2.darwin-11.0-arm64.tgz"
      sha256 "4271532ce111f9c41c8ead25a0d231ef02e31afb8d68b7711f07a32e77b12287"
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
    assert_match "25.1.2", output
  end

end

