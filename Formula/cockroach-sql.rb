# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "25.3.2"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.3.2.darwin-10.9-amd64.tgz"
      sha256 "c88f33c88b6be48918e4325a41e836756f4987f84df448c07f09cb2221ef1af6"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.3.2.darwin-11.0-arm64.tgz"
      sha256 "5c60bed8f7a1c1874f013723ca39e71e8758320b452d872e8e21fb1793d15129"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.3.2.linux-amd64.tgz"
      sha256 "5a5ea187c6e1e7c47b79e513e2a3b2d846eeb54a1b69964ec57094908be4975b"
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
    assert_match "25.3.2", output
  end
end
