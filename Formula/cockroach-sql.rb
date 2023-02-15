# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "22.2.3"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v22.2.3.darwin-10.9-amd64.tgz"
      sha256 "3d18eea41824aa5a6b70eb9043f29d84f54bf14a7317cc9f5a71086a20964bea"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v22.2.3.darwin-11.0-arm64.tgz"
      sha256 "28ac8ad22a70f0d52ccaff189cac670103c3e8a7e01bb39f010d7398d3512c94"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "22.2.3", output
  end

end

