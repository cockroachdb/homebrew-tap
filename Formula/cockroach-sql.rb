# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "23.1.9"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.9.darwin-10.9-amd64.tgz"
      sha256 "167384d05211b998e0b213f0f1c89a267df3fdc2feec22c6d2fa623068195c8f"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.9.darwin-11.0-arm64.tgz"
      sha256 "b4c75ce2284570206dea3599d2e5cfd636a09b9984a8ba12f06b6d809c9b06bb"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "23.1.9", output
  end

end

