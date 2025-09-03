# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "25.3.1"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.3.1.darwin-10.9-amd64.tgz"
      sha256 "e2ceec502bbe4016e06f4fc43f6fe783d4f23fbffa360706c926d44930381520"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.3.1.darwin-11.0-arm64.tgz"
      sha256 "bc30529c5c12577b5fc8a249989e066fe6222571fb926684ebc7524a8750d895"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.3.1.linux-amd64.tgz"
      sha256 "bab0cf2521ad02fdba25d9de9abd76070f530ac7b6dbfb94a30b602f4dc5188a"
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
    assert_match "25.3.1", output
  end
end
