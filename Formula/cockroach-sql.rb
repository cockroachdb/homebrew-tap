# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "24.1.2"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.1.2.darwin-10.9-amd64.tgz"
      sha256 "1b10f0e27d919194704d677db331f2fefae4a3282ade33a4e15ec3d4fb4dff64"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.1.2.darwin-11.0-arm64.tgz"
      sha256 "48dc00a1edd4625d3941c7263303a9fd516e0566243efb76b576b34f833b35c2"
    end
  end

  def install
    bin.install "cockroach-sql"
    prefix.install "LICENSE.txt", "THIRD-PARTY-NOTICES.txt"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "24.1.2", output
  end

end

