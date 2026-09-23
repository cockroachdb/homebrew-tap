# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "26.3.2"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.3.2.darwin-10.9-amd64.tgz"
      sha256 "9bad8d952ce435e6db5eb9a373a429feee355a6854881bbabcb307c8ce76eb17"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.3.2.darwin-11.0-arm64.tgz"
      sha256 "030c0dc19f9e046e4e5db9df92d4d699ed15bac53b53f42da11d3ffee133fb0f"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.3.2.linux-amd64.tgz"
      sha256 "12064839c056013f7ae90cf18844eff84dfac472f0ef3bb22946e904b64dc638"
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
    assert_match "26.3.2", output
  end
end
