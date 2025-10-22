# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "25.3.3"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.3.3.darwin-10.9-amd64.tgz"
      sha256 "8f8eb96fbca82c362bbb72ef86562ba5ae03ee4116f39f75563a760a9d486fec"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.3.3.darwin-11.0-arm64.tgz"
      sha256 "bae15d2fb7ad6837917d75c6327de4541098bac521e63f80c993e6de44638501"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.3.3.linux-amd64.tgz"
      sha256 "c995cda86d32953f77ce36e7ea4c0b222d23e51ac035ec6a36e7a2927263eb7d"
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
    assert_match "25.3.3", output
  end
end
