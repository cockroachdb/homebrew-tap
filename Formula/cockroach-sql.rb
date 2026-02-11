# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "25.4.4"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.4.4.darwin-10.9-amd64.tgz"
      sha256 "60d5057ce947a6ac09545eca0c25b9dcd3b09a433555cfaaf088e7953a33fb8a"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.4.4.darwin-11.0-arm64.tgz"
      sha256 "e282f1530401fee18de8a580ecee4e691a4de9f39b9eaf0f9351f2429a166fb3"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.4.4.linux-amd64.tgz"
      sha256 "1e93f051ce4d11dba2f9e0c5413b810549503aae1cc152d604ab0ee6f8b84561"
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
    assert_match "25.4.4", output
  end
end
