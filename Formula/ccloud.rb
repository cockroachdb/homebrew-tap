# Auto-generated file, DO NOT EDIT
# Source: release/ccloud-tmpl.rb

class Ccloud < Formula
  desc "CockroachDB Cloud CLI"
  homepage "https://www.cockroachlabs.com"
  url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-amd64_0.2.2.tar.gz"
  version "0.2.2"
  sha256 "6793f246805c6c4909de9dca47e8d88a0e7af72cca41087da86065f92684ccbb"

  def install
    bin.install "ccloud"
  end

  test do
    output = shell_output("#{bin}/ccloud version", 0)
    assert_match "ccloud 0.2.2", output
  end
end

