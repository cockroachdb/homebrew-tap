# Auto-generated file, DO NOT EDIT
# Source: release/ccloud-tmpl.rb

class Ccloud < Formula
  desc "CockroachDB Cloud CLI"
  homepage "https://www.cockroachlabs.com"
  version "0.7.14"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-amd64_0.7.14.tar.gz"
      sha256 "58b3afed0dc1aa892c8c519abb70ace10bf5faac9e82a8b4be93e654f07de692"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-arm64_0.7.14.tar.gz"
      sha256 "25c3760d4a21b69a39ab0460654190ee9bb2fe37477985f9a3080fe0171d194a"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_linux-amd64_0.7.14.tar.gz"
      sha256 "2022e62fcbdaade7d5cb513fb937252c7895c40827d480e59a950fd4c5d7c671"
    end
  end

  def install
    bin.install "ccloud"
  end

  test do
    output = shell_output("#{bin}/ccloud version")
    assert_match "ccloud 0.7.14", output
  end
end
