# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "26.1.1"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.1.1.darwin-10.9-amd64.tgz"
      sha256 "53f917d91128eabe0c7c9761891590b2659275e78f4381e14f975a36f0be40d8"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.1.1.darwin-11.0-arm64.tgz"
      sha256 "7c1d39a7032fd504266c9eb5dbe7174e1ee524fa5c656b20cf00d8b132b9fc6b"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.1.1.linux-amd64.tgz"
      sha256 "228d0e1c9e19d4dc57a9b2dc6e6823be81954755be7b071972954a780955fe92"
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
    assert_match "26.1.1", output
  end
end
