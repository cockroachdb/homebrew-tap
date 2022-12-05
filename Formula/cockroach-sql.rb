# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "22.2.0"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v22.2.0.darwin-10.9-amd64.tgz"
      sha256 "f4e80386dba6af8e85978785a98617dd76beee13bc0f104cc809927f6a01514b"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v22.2.0.darwin-11.0-aarch64.tgz"
      sha256 "328dc8b28c4ebc99d756df8e4909df2863fe771960ad51155a2a49fd9aa50d37"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "22.2.0", output
  end

end

