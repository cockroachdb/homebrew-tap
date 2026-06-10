# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "26.2.2"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.2.2.darwin-10.9-amd64.tgz"
      sha256 "d63a547e7596fa3e6f427058ec1b210e4d118e8182cdc8cb838c50b4ee9fc359"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.2.2.darwin-11.0-arm64.tgz"
      sha256 "eea84d5ec43f0d80fcd82399e3659d610df0c00a973dfc020b6e832208df9d55"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.2.2.linux-amd64.tgz"
      sha256 "abab9881ebb4afdfa3e10ade1cefa857e762340b36af7b61056b5bc87ce94777"
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
    assert_match "26.2.2", output
  end
end
