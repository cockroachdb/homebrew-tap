# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "25.2.4"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.2.4.darwin-10.9-amd64.tgz"
      sha256 "ec0f1a660b423a9361975548fd687a2e19fd05e3b19eb2bb84226dbd5ccb4cef"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.2.4.darwin-11.0-arm64.tgz"
      sha256 "1609287acab0f62865e74a968e56b0516c59a0fd85b8c79e5a938ed453a7b73d"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.2.4.linux-amd64.tgz"
      sha256 "f80af55de16f4153425f55c2d53cac24c42d580f03214f1be5d098a230772d47"
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
    assert_match "25.2.4", output
  end
end
