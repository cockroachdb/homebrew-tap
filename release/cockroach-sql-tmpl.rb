# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "{{ .Version }}"

  on_macos do
    on_intel do
      url "{{ .DarwinAMD64URL }}"
      sha256 "{{ .DarwinAMD64SHA256 }}"
    end
    on_arm do
      url "{{ .DarwinARM64URL }}"
      sha256 "{{ .DarwinARM64SHA256 }}"
    end
  end

  on_linux do
    on_intel do
      url "{{ .LinuxAMD64URL }}"
      sha256 "{{ .LinuxAMD64SHA256 }}"
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
    assert_match "{{ .Version }}", output
  end
end
