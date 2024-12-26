# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "24.3.2"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.3.2.darwin-10.9-amd64.tgz"
      sha256 "fbc7bd2c1b775dbb44b8cd9998aaf061505b236159a39ef0c6547a5016f290ea"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.3.2.darwin-11.0-arm64.tgz"
      sha256 "b596ad3d7c435f61eb056ba521cbab4bc5447284342cc493987c08ad2db9cbd8"
    end
  end

  def install
    bin.install "cockroach-sql"
    prefix.install "LICENSE" if File.exist?("LICENSE")
    prefix.install "LICENSE.txt" if File.exist?("LICENSE.txt")
    prefix.install "THIRD-PARTY-NOTICES.txt"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "24.3.2", output
  end

end

