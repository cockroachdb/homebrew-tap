# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "26.3.1"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.3.1.darwin-10.9-amd64.tgz"
      sha256 "b5fac6935d083db2c81311cf965aa4fd7e8b85a599c149cc9ed84e8454ce89af"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.3.1.darwin-11.0-arm64.tgz"
      sha256 "e5675ae098cd9a035520bb88f45ee4de88d149e76ea838a9ed48497504a3dd76"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.3.1.linux-amd64.tgz"
      sha256 "bced4b847218e5cca7a5fa2380a107956aae1ac6e4075f615cd6e9b93aa188b3"
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
    assert_match "26.3.1", output
  end
end
