# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "24.3.5"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.3.5.darwin-10.9-amd64.tgz"
      sha256 "960c130bd4339f1a866107c9ed053f2bb78ffc18bb3b6f6365d406aab545dc05"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.3.5.darwin-11.0-arm64.tgz"
      sha256 "549e6ff1381d5b2334b9f534199402fa2f69b3af7adb6aae5a49b85a4f0ac60e"
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
    assert_match "24.3.5", output
  end

end

