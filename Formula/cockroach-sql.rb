# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "25.4.2"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.4.2.darwin-10.9-amd64.tgz"
      sha256 "a8dee0119db33ea95e2e5d177fb2762bea3127c8ad870dedfacb294593bdb49a"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.4.2.darwin-11.0-arm64.tgz"
      sha256 "c26e6db0433dfa341ac1aef02271d8a09c77d6a576958b30ce7f7492d0ef5163"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.4.2.linux-amd64.tgz"
      sha256 "69af821a5cc68b4dfaa75ac14fc1798db286cefb3d696d09576c4bd56706d01d"
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
    assert_match "25.4.2", output
  end
end
