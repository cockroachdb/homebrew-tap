# Auto-generated file, DO NOT EDIT
# Source: release/ccloud-tmpl.rb

class Ccloud < Formula
  desc "CockroachDB Cloud CLI"
  homepage "https://www.cockroachlabs.com"
  version "0.3.6"
  url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-amd64_0.3.6.tar.gz"
  sha256 "726f370941e14bab9478a29923f33529ad357b49f9431d813477472259554cff"

  def install
    bin.install "ccloud"
  end

  test do
    output = shell_output("#{bin}/ccloud version", 0)
    assert_match "ccloud 0.3.6", output
  end
end

