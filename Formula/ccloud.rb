# Auto-generated file, DO NOT EDIT
# Source: release/ccloud-tmpl.rb

class Ccloud < Formula
  desc "CockroachDB Cloud CLI"
  homepage "https://www.cockroachlabs.com"
  url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-amd64_0.2.2.tar.gz"
  version "0.2.2"
  sha256 "043b4d9a719d0bd09ccd51cf4c539655dc4b31380bd6396f259130eb9862ace4"

  def install
    bin.install "ccloud"
  end

  test do
    output = shell_output("#{bin}/ccloud version", 0)
    assert_match "ccloud 0.2.2", output
  end
end

