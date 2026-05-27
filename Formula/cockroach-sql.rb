# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "26.2.1"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.2.1.darwin-10.9-amd64.tgz"
      sha256 "4751bda9cfd30dd991f8ed627cbbd513f4f8bd1aa50e46cf7a53772fb504926d"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.2.1.darwin-11.0-arm64.tgz"
      sha256 "52e9621f874ff056977804fa3f1f03d0f387bc9715aa585c6e6f5a19c8a70136"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.2.1.linux-amd64.tgz"
      sha256 "6e22f1991e9a042bda3a98aef9d338ee123f5a777d3ac2d3a9c2fbfe19282fed"
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
    assert_match "26.2.1", output
  end
end
