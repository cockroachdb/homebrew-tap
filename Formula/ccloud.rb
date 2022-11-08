# Auto-generated file, DO NOT EDIT
# Source: release/ccloud-tmpl.rb

class Ccloud < Formula
  desc "CockroachDB Cloud CLI"
  homepage "https://www.cockroachlabs.com"
  url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-amd64_0.2.4.tar.gz"
  version "0.2.4"
  sha256 "53d3115c097fc38d7153fefc84298abe0c64e4247a5b7e175be8aae376034719"

  def install
    bin.install "ccloud"
  end

  test do
    output = shell_output("#{bin}/ccloud version", 0)
    assert_match "ccloud 0.2.4", output
  end
end

