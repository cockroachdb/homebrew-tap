# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "26.3.3"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.3.3.darwin-10.9-amd64.tgz"
      sha256 "a110261842fc1c43330d3e10777f7f93c786b95adec640db871d4734597df07c"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.3.3.darwin-11.0-arm64.tgz"
      sha256 "58c14df9d355f030acb6b7f00dd41ef2dbbf493389bc600dc1511985f9eda93d"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.3.3.linux-amd64.tgz"
      sha256 "159ac5512f290cdc674d4c53ff12c4994993824b7254d4a034f77614e71df6cb"
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
    assert_match "26.3.3", output
  end
end
