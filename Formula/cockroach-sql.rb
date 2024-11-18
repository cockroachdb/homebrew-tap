# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "24.2.5"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.2.5.darwin-10.9-amd64.tgz"
      sha256 "b2979ea622f4cffc0495e5c4aa8747d5df121f3e55e9a052c9e4de84cec0a331"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.2.5.darwin-11.0-arm64.tgz"
      sha256 "ff6c35312b91eea954117e87ded4048d2a22e9bbc64945e170131b74f333edec"
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
    assert_match "24.2.5", output
  end

end

