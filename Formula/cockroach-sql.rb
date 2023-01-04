# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "22.2.2"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v22.2.2.darwin-10.9-amd64.tgz"
      sha256 "faf990da7a1a20959dce889fa189801f5e0653b24fab0e3657e6c67b91bbf65d"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v22.2.2.darwin-11.0-aarch64.tgz"
      sha256 "5c3842ba9afcf2c9a065c4d49bf422933ad93074a49758c610564b98eec4df3d"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "22.2.2", output
  end

end

