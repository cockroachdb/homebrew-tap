# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "25.3.0"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.3.0.darwin-10.9-amd64.tgz"
      sha256 "259403b1c060ee05aa2a96155c2932452de4413a79e7cb921c31fecb23ea856f"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.3.0.darwin-11.0-arm64.tgz"
      sha256 "a1e114fef57cc8dc64d6ec4f923c66b012dc4f3fcaf7326e6ae74f52fc157003"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.3.0.linux-amd64.tgz"
      sha256 "846c45efbd69fccd45d6adcfa36bb06ce63fd6b2cfcde673737809bd507a94a3"
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
    assert_match "25.3.0", output
  end
end
