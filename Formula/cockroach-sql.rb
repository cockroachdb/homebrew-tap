# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "26.3.5"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.3.5.darwin-10.9-amd64.tgz"
      sha256 "04e448aa38711227551f6a058fde04003a00fdc6cdd620ff5a7870efe9ba4389"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.3.5.darwin-11.0-arm64.tgz"
      sha256 "c2057c8bdf8e63de13a2d4f90d55e148b036863c438306a4ad5f9499cbe4dd7c"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.3.5.linux-amd64.tgz"
      sha256 "ac5cbdf915013d9325c5b21134149b96196e962e979a6daf5d733d3a2894dbd4"
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
    assert_match "26.3.5", output
  end
end
