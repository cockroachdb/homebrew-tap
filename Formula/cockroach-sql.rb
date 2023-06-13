# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "23.1.3"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.3.darwin-10.9-amd64.tgz"
      sha256 "76304051115824fa914f80f0a6426c7b481084a19396623a29406f089c5fcd69"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.1.3.darwin-11.0-arm64.tgz"
      sha256 "ad0ebe1367a4ec7b2dc5593c4c511fa2320dcc62c389cbfccbd41c7a64991b56"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "23.1.3", output
  end

end

