# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "22.2.8"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v22.2.8.darwin-10.9-amd64.tgz"
      sha256 "1d143178fddca0a5c8783116d89bb04249d09405c8be9054ec4c53e2646a8b8e"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v22.2.8.darwin-11.0-arm64.tgz"
      sha256 "1ae6d35542198b856113ca35f5e07f932ce51c44f718e015f455b43691a10ea5"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "22.2.8", output
  end

end

