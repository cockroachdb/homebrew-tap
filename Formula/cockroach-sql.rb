# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "22.2.7"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v22.2.7.darwin-10.9-amd64.tgz"
      sha256 "b61943a3758b63e83c5a420ee5ca6aef5017260de26d55df46705bf12c67a08e"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v22.2.7.darwin-11.0-arm64.tgz"
      sha256 "5084703331848581114d4778338ad387e448eff7d62493db999097380ecbe34d"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "22.2.7", output
  end

end

