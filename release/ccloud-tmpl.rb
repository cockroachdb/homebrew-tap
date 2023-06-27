# Auto-generated file, DO NOT EDIT
# Source: release/ccloud-tmpl.rb

class Ccloud < Formula
  desc "CockroachDB Cloud CLI"
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
    bin.install "ccloud"
  end

  test do
    output = shell_output("#{bin}/ccloud version", 0)
    assert_match "ccloud {{ .Version }}", output
  end
end
