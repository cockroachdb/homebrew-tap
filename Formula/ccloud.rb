# Auto-generated file, DO NOT EDIT
# Source: release/ccloud-tmpl.rb

class Ccloud < Formula
  desc "CockroachDB Cloud CLI"
  homepage "https://www.cockroachlabs.com"
  url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-amd64_0.2.5.tar.gz"
  version "0.2.5"
  sha256 "e2a64f7a8f76812d9a08cd029452262e70717f448adb75e0f50733f8ff25e544"

  def install
    bin.install "ccloud"
  end

  test do
    output = shell_output("#{bin}/ccloud version", 0)
    assert_match "ccloud 0.2.5", output
  end
end

