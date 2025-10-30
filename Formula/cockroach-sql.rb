# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "25.3.4"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.3.4.darwin-10.9-amd64.tgz"
      sha256 "39bb4f9a40d7960ee904394b733c75c79cb363f20141873ec1bccbf1b31c2eac"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.3.4.darwin-11.0-arm64.tgz"
      sha256 "44c7032b07bad89ddf97e21fc2ababa39fe85ba107de11c69f6fcb9ddb8638ca"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.3.4.linux-amd64.tgz"
      sha256 "5e09080c722f5f6381554e76535fa09f9c6d9f65a7932e17832c0447b0947ba5"
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
    assert_match "25.3.4", output
  end
end
