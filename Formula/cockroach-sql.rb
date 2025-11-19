# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "25.4.0"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.4.0.darwin-10.9-amd64.tgz"
      sha256 "a22086b0f26f239af4e9e2b7fe189b433913f6afd22fdef161f6e56ced23448b"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.4.0.darwin-11.0-arm64.tgz"
      sha256 "c6f83cdaeed14b709f2a57221dca310ddb3788b5caf562056127a304874bc028"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.4.0.linux-amd64.tgz"
      sha256 "0a95183c7b5a7522ae38a63a69a4bc490e858a6aeb10d6f29dce79afd6c0e1b7"
    end
  end

  def install
    bin.install "cockroach-sql"
    prefix.install "LICENSE" if File.exist?("LICENSE")
    prefix.install "LICENSE.txt" if File.exist?("LICENSE.txt")
    prefix.install "THIRD-PARTY-NOTICES.txt"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version")
    assert_match "25.4.0", output
  end
end
