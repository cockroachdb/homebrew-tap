# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "24.2.2"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.2.2.darwin-10.9-amd64.tgz"
      sha256 "2993a61f5da29b3d4d1640383869088cf00b689f35e05dd5a0c96d2a2839c3c4"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.2.2.darwin-11.0-arm64.tgz"
      sha256 "8cca9240662bf15fd2be3e6b2ba35216a45f854f0415536ec5b71152ceb14458"
    end
  end

  def install
    bin.install "cockroach-sql"
    prefix.install "LICENSE.txt", "THIRD-PARTY-NOTICES.txt"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "24.2.2", output
  end

end

