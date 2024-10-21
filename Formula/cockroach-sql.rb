# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "24.2.4"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.2.4.darwin-10.9-amd64.tgz"
      sha256 "d375bda1cac4674194ea83e4363d8d8868c3579b27e42f4d92e337e4e4ed78e9"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v24.2.4.darwin-11.0-arm64.tgz"
      sha256 "f720c9baae6d22473741521b4f3f9ae530f72f3ef898ffd26d6c7d19361078cc"
    end
  end

  def install
    bin.install "cockroach-sql"
    prefix.install "LICENSE" if File.exist?("LICENSE")
    prefix.install "LICENSE.txt" if File.exist?("LICENSE.txt") 
    prefix.install "THIRD-PARTY-NOTICES.txt"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "24.2.4", output
  end

end

