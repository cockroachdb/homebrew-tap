# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "23.1.1"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.1.darwin-10.9-amd64.tgz"
      sha256 "386dc01e49bad96ac298b2d5a5285ed4e1b741df62c6e89691df5b5f2d0221d6"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.1.darwin-11.0-arm64.tgz"
      sha256 "900d1e46bcb3f067e3fdb6ba38e1bd50a91fc4ef541d2145eb96490985dea485"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "23.1.1", output
  end

end

