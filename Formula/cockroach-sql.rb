# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "26.4.0"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.4.0.darwin-10.9-amd64.tgz"
      sha256 "9c828627c8a5fbe76648dafec51b442b978e32d28a666ecc8200c62b82378180"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.4.0.darwin-11.0-arm64.tgz"
      sha256 "81372ddf8d1705b6fed01ce5d5f69148224812d4b36075b3544d2789951fbe10"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.4.0.linux-amd64.tgz"
      sha256 "028446fe7dacdc934dfdaa5f71573df29835bb0aad177872351ec224307339e7"
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
    assert_match "26.4.0", output
  end
end
