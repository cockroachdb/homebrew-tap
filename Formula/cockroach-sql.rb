# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "24.1.1"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.1.1.darwin-10.9-amd64.tgz"
      sha256 "ee5a6d8284b7c275b3d412415e61ace2808bbe4df2508bae8224e2245a539928"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.1.1.darwin-11.0-arm64.tgz"
      sha256 "3efca2d73226ba9c19b13161684892b48104e81c108b5d1ab6c80611449828ea"
    end
  end

  def install
    bin.install "cockroach-sql"
    prefix.install "LICENSE.txt", "THIRD-PARTY-NOTICES.txt"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "24.1.1", output
  end

end

