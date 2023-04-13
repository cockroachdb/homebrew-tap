# Auto-generated file, DO NOT EDIT
# Source: release/ccloud-tmpl.rb

class Ccloud < Formula
  desc "CockroachDB Cloud CLI"
  homepage "https://www.cockroachlabs.com"
  version "0.3.7"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-amd64_0.3.7.tar.gz"
      sha256 "a0999ec88afb762da7686797d0ac910c38ba13851c1e10946277e28aa0eb3051"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-arm64_0.3.7.tar.gz"
      sha256 "0722bdc9713174c2bc03702e9ab6f7da6216ea8a2421c9015075da8288781ff3"
    end
  end

  def install
    bin.install "ccloud"
  end

  test do
    output = shell_output("#{bin}/ccloud version", 0)
    assert_match "ccloud 0.3.7", output
  end
end

