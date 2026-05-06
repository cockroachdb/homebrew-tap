# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "26.1.4"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.1.4.darwin-10.9-amd64.tgz"
      sha256 "71503142f0c22600a7d304678d1dba79a4a590885b925ab3fbf58180c4434cfa"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.1.4.darwin-11.0-arm64.tgz"
      sha256 "1b1487fa692ba0b078669eb55a4fd859a056d456158959fa98eaa3b89da32897"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v26.1.4.linux-amd64.tgz"
      sha256 "eb6b85dcfcaa14cc4015228d6f60ad6548f3c1e65ddb866b005ede38cd0dc201"
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
    assert_match "26.1.4", output
  end
end
