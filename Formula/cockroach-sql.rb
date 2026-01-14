# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "25.4.3"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.4.3.darwin-10.9-amd64.tgz"
      sha256 "6ff8b5d4e3abcbcf0c9a0d76831ec24333565f63ad32dad59d8e3b2499b2d411"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.4.3.darwin-11.0-arm64.tgz"
      sha256 "1ffc7f3bf02fc6eba866beb86e0ff7d2bdc5ca0d7395e78ab665bbf78538a552"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.4.3.linux-amd64.tgz"
      sha256 "e8de40ed3cdae42c7e6a3202cd2f3ca56e292dea61befd0a0c9e5983c7927ce8"
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
    assert_match "25.4.3", output
  end
end
