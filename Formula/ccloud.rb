# Auto-generated file, DO NOT EDIT
# Source: release/ccloud-tmpl.rb

class Ccloud < Formula
  desc "CockroachDB Cloud CLI"
  homepage "https://www.cockroachlabs.com"
  url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-amd64_0.1.1.tar.gz"
  version "0.1.1"
  sha256 "65d41a0e3a82274aaeb63e7fe5f6f33209b02a711d9894ce4580f642f6be561e"

  def install
    bin.install "ccloud"
  end

  test do
    output = shell_output("#{bin}/ccloud version", 0)
    assert_match "ccloud 0.1.1", output
  end
end

