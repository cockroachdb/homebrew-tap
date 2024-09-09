# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "24.2.1"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.2.1.darwin-10.9-amd64.tgz"
      sha256 "c5deaaa3baec543f43e641535850b6903a37e8573e3c3ca58d597d9cd255f95f"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.2.1.darwin-11.0-arm64.tgz"
      sha256 "dccb6aad8efe497b7726b538316de1e87131330c1528fdb49ed01e94bad7fbe3"
    end
  end

  def install
    bin.install "cockroach-sql"
    prefix.install "LICENSE.txt", "THIRD-PARTY-NOTICES.txt"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "24.2.1", output
  end

end

