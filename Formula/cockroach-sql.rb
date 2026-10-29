# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "26.3.4"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.3.4.darwin-10.9-amd64.tgz"
      sha256 "9eedb4210b45f90108de6c01804ef4df496055a9c76e864e3a97c34759f00a40"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.3.4.darwin-11.0-arm64.tgz"
      sha256 "6531cf5de0e06d989f5cdbfc6bb088477d834b0423353528d5543960eecf813b"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.3.4.linux-amd64.tgz"
      sha256 "1121dc0007cfd121c9d8f76e4822318907e1fbc4fb60602126a383d958632d9c"
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
    assert_match "26.3.4", output
  end
end
