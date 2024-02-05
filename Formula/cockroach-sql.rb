# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "23.2.0"
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.2.0.darwin-10.9-amd64.tgz"
      sha256 "63043e6024bfc28f91e4fb50ea1f91e741476c0876de89ddaf01b7eb66051c2f"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-sql-v23.2.0.darwin-11.0-arm64.tgz"
      sha256 "b4a22f06188700e7e1c65b436a10dc01df402faa9f5b11da9f71e70dd5ca1c65"
    end
  end

  def install
    bin.install "cockroach-sql"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "23.2.0", output
  end

end

