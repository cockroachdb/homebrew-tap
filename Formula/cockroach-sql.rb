# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "23.1.5"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.5.darwin-10.9-amd64.tgz"
      sha256 "1b8d887175f219095673679ba4d4d5fb48deea523c873f3b367f3b95ab1a26ff"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.5.darwin-11.0-arm64.tgz"
      sha256 "7fe05f3537c1bce7bf5dc66c740679d4c0c7068c875f6e7ad32ad54850e41c6f"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "23.1.5", output
  end

end

