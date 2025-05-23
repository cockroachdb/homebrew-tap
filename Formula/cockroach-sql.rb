# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "25.2.0"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.2.0.darwin-10.9-amd64.tgz"
      sha256 "f19a5d3e0bb2ace0761bf893770d180e22bfe7c0b68d41bf0ce2c866af73560d"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.2.0.darwin-11.0-arm64.tgz"
      sha256 "0d25ca9c577cd68a07f6566929ce6630936bc47f65516cb55f8bc53194e3230e"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.2.0.linux-amd64.tgz"
      sha256 "b91520300148cb03f11047ccbbb432b1df3115ab85a499f42c7cf2115753b95d"
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
    assert_match "25.2.0", output
  end
end
