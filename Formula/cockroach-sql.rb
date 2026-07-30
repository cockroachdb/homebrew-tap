# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "26.2.5"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.2.5.darwin-10.9-amd64.tgz"
      sha256 "68b704334c10212625e168d0fef2cfade93a9681aca95d07ed8c3406d57348ef"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.2.5.darwin-11.0-arm64.tgz"
      sha256 "a05f0711c8e4409edee07ef95cc7f4a32ee128ebe940760cc2f2fd86f538988e"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.2.5.linux-amd64.tgz"
      sha256 "1c4a903bbd02d327db860f1af206702bfb1276eb67728d6e0278835aa64636a7"
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
    assert_match "26.2.5", output
  end
end
