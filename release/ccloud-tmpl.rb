# Auto-generated file, DO NOT EDIT
# Source: release/ccloud-tmpl.rb

class Ccloud < Formula
  desc "CockroachDB Cloud CLI"
  homepage "https://www.cockroachlabs.com"
  version "{{ .Version }}"
  url "{{ .IntelURL }}"
  sha256 "{{ .IntelSHA256 }}"

  def install
    bin.install "ccloud"
  end

  test do
    output = shell_output("#{bin}/ccloud version", 0)
    assert_match "ccloud {{ .Version }}", output
  end
end
