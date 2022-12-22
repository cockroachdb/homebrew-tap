# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "22.2.1"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v22.2.1.darwin-10.9-amd64.tgz"
      sha256 "799243cb6249ee2985e7f2d04b2074c8572d633fad00718299a8b3b5a019be89"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v22.2.1.darwin-11.0-aarch64.tgz"
      sha256 "05611cacb2d97fddbbe3811a64adbe189d98d591c771abe7065a264b7d6e63cc"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "22.2.1", output
  end

end

