# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-sql-tmpl.rb

class CockroachSql < Formula
  desc "Distributed SQL database shell"
  homepage "https://www.cockroachlabs.com"
  version "{{ .Version }}"
  on_macos do
    on_intel do
      url "{{ .MacIntelURL }}"
      sha256 "{{ .MacIntelSHA256 }}"
    end
    on_arm do
      url "{{ .MacARMURL }}"
      sha256 "{{ .MacARMSHA256 }}"
    end
  end
  on_linux do
    on_intel do
      url "{{ .LinuxIntelURL }}"
      sha256 "{{ .LinuxIntelSHA256 }}"
    end
    on_arm do
      url "{{ .LinuxARMURL }}"
      sha256 "{{ .LinuxARMSHA256 }}"
    end
  end

  def install
    bin.install "cockroach-sql"
    prefix.install "LICENSE" if File.exist?("LICENSE")
    prefix.install "LICENSE.txt" if File.exist?("LICENSE.txt")
    prefix.install "THIRD-PARTY-NOTICES.txt"
  end

  test do
    output = shell_output("#{bin}/cockroach-sql --version", 0)
    assert_match "{{ .Version }}", output
  end

end
