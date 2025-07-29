# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "25.2.3"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.2.3.darwin-10.9-amd64.tgz"
      sha256 "b76c84033983f038628c0be555c85d5fbcdb8032a358a23e3e12b6ce115392d7"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.2.3.darwin-11.0-arm64.tgz"
      sha256 "d6c06287fa9280ed869d6c4db99e34e889ef8bd41cec31709331a9f5907a0023"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.2.3.linux-amd64.tgz"
      sha256 "19bf8c8bf3a8cdd04d6c492939cb09340f95517ffaa61a97f566b0e469d7f97a"
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
    assert_match "25.2.3", output
  end
end
