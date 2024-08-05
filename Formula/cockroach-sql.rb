# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "24.1.3"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.1.3.darwin-10.9-amd64.tgz"
      sha256 "eff8b9427afbb7b7901ec78456935fcdd74a49b4691e6c68c8262faa1d992d58"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.1.3.darwin-11.0-arm64.tgz"
      sha256 "d51482ca36ee3f4b1a1da7ab607db125d8592831d9844f1e1698cbcd5d246eca"
    end
  end

  def install
    bin.install "cockroach-sql"
    prefix.install "LICENSE.txt", "THIRD-PARTY-NOTICES.txt"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "24.1.3", output
  end

end

