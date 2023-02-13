# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "22.2.4"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v22.2.4.darwin-10.9-amd64.tgz"
      sha256 "b79533d62a812a5e47152f984cb027254a5e47144a0fc5d7b99c44833e31dd73"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v22.2.4.darwin-11.0-arm64.tgz"
      sha256 "2476e54242d5177bfabe46a3dddaa66a963e94fa0643385583c9a00c51963968"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "22.2.4", output
  end

end

