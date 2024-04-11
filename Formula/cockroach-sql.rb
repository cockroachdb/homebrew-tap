# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "23.2.4"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.2.4.darwin-10.9-amd64.tgz"
      sha256 "db4e53ad276f3aea79b727a05b7c8641cfc61fcd562070507e0bafd6a4014c0c"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.2.4.darwin-11.0-arm64.tgz"
      sha256 "63b9c993ee85a791d489ea6c530eb9bb5ff876b90a43b1a1deb709449edf38da"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "23.2.4", output
  end

end

