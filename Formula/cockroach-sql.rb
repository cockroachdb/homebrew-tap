# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "24.1.0"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.1.0.darwin-10.9-amd64.tgz"
      sha256 "d4cc8daaf5fa02c70caf42b06f0ab9eb2c0e16b98f0073f624cf8cccb361c75a"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.1.0.darwin-11.0-arm64.tgz"
      sha256 "7e83ad959c7a5c5e22649fddde47a8cd3de086d5fa1ca17d0ff3141fa359eab3"
    end
  end

  def install
    bin.install "cockroach-sql"
    prefix.install "LICENSE.txt", "THIRD-PARTY-NOTICES.txt"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "24.1.0", output
  end

end

