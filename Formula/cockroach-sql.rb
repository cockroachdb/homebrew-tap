# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "23.1.6"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.6.darwin-10.9-amd64.tgz"
      sha256 "45537525e9d75bc85b114739fbfecd35ea312ce16ba3729972bc602b60cc6842"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.6.darwin-11.0-arm64.tgz"
      sha256 "63c0dfb1ea4c72a569e4df560da1f5e6d0965c1f5c3a9921aff6415e4f0de2e8"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "23.1.6", output
  end

end

