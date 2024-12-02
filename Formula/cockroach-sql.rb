# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "24.3.0"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.3.0.darwin-10.9-amd64.tgz"
      sha256 "148ae2532c6079d54df00cb6ba380db190797fac8664f1312d1dbb648e9a39a4"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.3.0.darwin-11.0-arm64.tgz"
      sha256 "e55a66c7d73bc39e68d297b6bf3794a21c494e53df1877f34dde4f819ee258d6"
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
    assert_match "24.3.0", output
  end

end

