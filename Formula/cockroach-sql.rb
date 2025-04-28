# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "25.1.5"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.1.5.darwin-10.9-amd64.tgz"
      sha256 "3b0b2e5eb27d03317ef82d936bcd453be48f7dd45d77dbf825163ddd9b75f88c"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.1.5.darwin-11.0-arm64.tgz"
      sha256 "5b91573821ca8935485cd2fe40e2981eb615b37bdeb320146c9f25a281c75784"
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
    assert_match "25.1.5", output
  end

end

