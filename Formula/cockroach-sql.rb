# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "23.2.3"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.2.3.darwin-10.9-amd64.tgz"
      sha256 "c8bbd1a951936f43ac25335e840e8f68e87a79a28e0a93aeee0110a83ae0cc65"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.2.3.darwin-11.0-arm64.tgz"
      sha256 "2c504104fa4cd5fea4177c4c59d060c442db616e97bb91a47e3de568c500b9b3"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "23.2.3", output
  end

end

