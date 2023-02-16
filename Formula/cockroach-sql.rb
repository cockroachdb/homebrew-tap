# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "22.2.5"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v22.2.5.darwin-10.9-amd64.tgz"
      sha256 "aa6ad25fb98b99f7bfea5b07534e5c1c47683c02054de357e62c80db43542a7b"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v22.2.5.darwin-11.0-arm64.tgz"
      sha256 "9f456120d48cdf2c71b5c001a93688501b05e0adfa081ae92af12f2f74b75b5d"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "22.2.5", output
  end

end

