# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "26.4.1"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.4.1.darwin-10.9-amd64.tgz"
      sha256 "544812b3904681293379052906e9478c98972d670945cd9d20813d256ed0ce2e"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.4.1.darwin-11.0-arm64.tgz"
      sha256 "bc4e05933fcecfb13861d14a2f9f2f71aabd2b81dff7fab1b3c06cecc5a46c32"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.4.1.linux-amd64.tgz"
      sha256 "9a75cd9865a04df5bffbbe5930ece3c21a2fd49c1e602d7e3b6fc15787dde858"
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
    assert_match "26.4.1", output
  end
end
