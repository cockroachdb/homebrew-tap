# Auto-generated file, DO NOT EDIT
# Source: release/ccloud-tmpl.rb

class Ccloud < Formula
  desc "CockroachDB Cloud CLI"
  homepage "https://www.cockroachlabs.com"
  version "0.5.11"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-amd64_0.5.11.tar.gz"
      sha256 "3438e02d935aa7f963497ef78ee990764bd66b3109510a24652b427e59c54127"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-arm64_0.5.11.tar.gz"
      sha256 "45764d12a49d834e18e34f9a29709095f0806e2cbd5cc84afad6260e936a003b"
    end
  end

  def install
    bin.install "ccloud"
  end

  test do
    output = shell_output("#{bin}/ccloud version", 0)
    assert_match "ccloud 0.5.11", output
  end
end

