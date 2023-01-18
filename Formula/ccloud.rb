# Auto-generated file, DO NOT EDIT
# Source: release/ccloud-tmpl.rb

class Ccloud < Formula
  desc "CockroachDB Cloud CLI"
  homepage "https://www.cockroachlabs.com"
  version "0.3.7"
  url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-amd64_0.3.7.tar.gz"
  sha256 "a0999ec88afb762da7686797d0ac910c38ba13851c1e10946277e28aa0eb3051"

  def install
    bin.install "ccloud"
  end

  test do
    output = shell_output("#{bin}/ccloud version", 0)
    assert_match "ccloud 0.3.7", output
  end
end

