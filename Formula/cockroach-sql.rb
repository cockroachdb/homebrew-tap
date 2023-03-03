# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "22.2.6"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v22.2.6.darwin-10.9-amd64.tgz"
      sha256 "aaff0691ab9ee50d304cb4909a34bbea9eef1e216ab53457ba825f53e5bf7001"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v22.2.6.darwin-11.0-arm64.tgz"
      sha256 "4fccbef4c092f036a92a2bc82c265a0730baa86cc1cd3c8f59f7426491476afb"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "22.2.6", output
  end

end

