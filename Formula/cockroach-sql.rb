# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "26.1.0"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.1.0.darwin-10.9-amd64.tgz"
      sha256 "ccca71dd31c3d7fa7dbb5cc2c81ce7c1f6394e7cc9d37396e793b6c7a8a367bd"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.1.0.darwin-11.0-arm64.tgz"
      sha256 "9ca7f146665de3a4314256a80ecb4526040d365469cd32dd2acd4cfd702f53e5"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.1.0.linux-amd64.tgz"
      sha256 "d2f1fdf4f8c0ee62e1895e9e1bc38ab591a13f376646dbfd6b5487e9816225c2"
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
    assert_match "26.1.0", output
  end
end
