# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "26.2.0"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.2.0.darwin-10.9-amd64.tgz"
      sha256 "5079785d7b47a0ee8dd59f30e8cfd6841eb54ff02137bf9d779ef21fba6caf37"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.2.0.darwin-11.0-arm64.tgz"
      sha256 "42834759d4cba50f20c064a482d48e38a2f6c6ae80e3e457d356872b30246635"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.2.0.linux-amd64.tgz"
      sha256 "62b3da92d720d57d07eb451b4ab032f5738b46090a9116e3ccd9f8565f0a9c1f"
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
    assert_match "26.2.0", output
  end
end
