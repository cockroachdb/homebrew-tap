# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "23.1.12"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.12.darwin-10.9-amd64.tgz"
      sha256 "6085754532a5708d5861aa09d11a71f349bdf43f020995353804d43550b59e3c"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.12.darwin-11.0-arm64.tgz"
      sha256 "5445a7b8d58c96fd63fc8d678a919cbc35b42a594206e07ad75707266ac19a8a"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "23.1.12", output
  end

end

