# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "24.3.3"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.3.3.darwin-10.9-amd64.tgz"
      sha256 "10cf40b622d5c9e8c7435953dad2efb00a70372b71d0cb5cefef9bdec0a12430"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.3.3.darwin-11.0-arm64.tgz"
      sha256 "f41ef7f32294f35a96c2ab0c078c861228474b6b57297fab91be0b143d829dd8"
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
    assert_match "24.3.3", output
  end

end

