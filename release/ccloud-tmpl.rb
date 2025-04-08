# Auto-generated file, DO NOT EDIT
# Source: release/ccloud-tmpl.rb

class Ccloud < Formula
  desc "CockroachDB Cloud CLI"
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
    bin.install "ccloud"
  end

  test do
    output = shell_output("#{bin}/ccloud version", 0)
    assert_match "ccloud {{ .Version }}", output
  end
end
