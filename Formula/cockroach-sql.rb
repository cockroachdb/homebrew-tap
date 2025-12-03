# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "25.4.1"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.4.1.darwin-10.9-amd64.tgz"
      sha256 "f08ec31288308dc5ce37a05f19d86c3269374183e09b483b15bd80c20f5244d0"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.4.1.darwin-11.0-arm64.tgz"
      sha256 "ee95873e571cab5455f89563ab915b5ceb44ca1d7e7c83067e5f65bcb982b214"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v25.4.1.linux-amd64.tgz"
      sha256 "f3a8d736e1e8624e5fc7ef4b270d9ef0e05c7b63d2d844f0c0671ab48426c101"
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
    assert_match "25.4.1", output
  end
end
