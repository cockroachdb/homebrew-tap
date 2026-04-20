# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "26.1.3"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.1.3.darwin-10.9-amd64.tgz"
      sha256 "a2e9abbe84deef436ab6b8510688d5a09a3731389f8e452a9515f0227d066431"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.1.3.darwin-11.0-arm64.tgz"
      sha256 "9d5401d340cad87228d2845c7827a3afc20a9c879d3c0fe973a3c11aa4227af4"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.1.3.linux-amd64.tgz"
      sha256 "5851a2c1d2f0d0e24c2d10a1cc8d1e0af34527079fa45ba640ae314dd006079a"
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
    assert_match "26.1.3", output
  end
end
