# Auto-generated file, DO NOT EDIT
# Source: release/ccloud-tmpl.rb

class Ccloud < Formula
  desc "CockroachDB Cloud CLI"
  homepage "https://www.cockroachlabs.com"
  version "0.6.12"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-amd64_0.6.12.tar.gz"
      sha256 "0d76c7f3ca97b486eec1f106cf43afa0bd7206a1fd4cf0a945682e52731cc7f1"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-arm64_0.6.12.tar.gz"
      sha256 "40db5fa4f6117d3459f78b6a16510e90fe83876a0fbb375f5fac9436f12d74b5"
    end
  end

  def install
    bin.install "ccloud"
  end

  test do
    output = shell_output("#{bin}/ccloud version", 0)
    assert_match "ccloud 0.6.12", output
  end
end

