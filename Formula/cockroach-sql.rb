# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "24.3.1"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.3.1.darwin-10.9-amd64.tgz"
      sha256 "637fcb8a6912334d0a2f4fbc920d0c6c38620ef8a7f230eb4173e61d94649142"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.3.1.darwin-11.0-arm64.tgz"
      sha256 "3770acb50b40ea2b735b75a9a91e699311e8f25f967f317089ed61ae9948b343"
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
    assert_match "24.3.1", output
  end

end

