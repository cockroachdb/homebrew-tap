# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "{{ .Version }}"
  on_macos do
    on_intel do
      url "{{ .IntelURL }}"
      sha256 "{{ .IntelSHA256 }}"
    end
    on_arm do
      url "{{ .ARMURL }}"
      sha256 "{{ .ARMSHA256 }}"
    end
  end

  def install
    bin.install "cockroach-sql"
    prefix.install "LICENSE.txt", "THIRD-PARTY-NOTICES.txt"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "{{ .Version }}", output
  end

end
