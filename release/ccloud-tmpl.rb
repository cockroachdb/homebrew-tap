# Auto-generated file, DO NOT EDIT
# Source: release/ccloud-tmpl.rb

class Ccloud < Formula
  desc "CockroachDB Cloud CLI"
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
    bin.install "ccloud"
  end

  test do
    output = shell_output("#{bin}/ccloud version")
    assert_match "ccloud {{ .Version }}", output
  end
end
