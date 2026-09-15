# Auto-generated file, DO NOT EDIT
# Source: release/ccloud-tmpl.rb

class Ccloud < Formula
  desc "CockroachDB Cloud CLI"
  homepage "https://www.cockroachlabs.com"
  version "0.10.0"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-amd64_0.10.0.tar.gz"
      sha256 "94450680e6fd4bb77410192a31ee396d454ad41c1708f33970aa389c03753358"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-arm64_0.10.0.tar.gz"
      sha256 "9b157eff6b5beb1f8b3d31aa48f92415815f48dc8516f6a700f9db7c37ddc402"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_linux-amd64_0.10.0.tar.gz"
      sha256 "3ac3cdb524fc225fdd3a2199ca1740efcddc1a24e6fae8b885b2f7affd07db63"
    end
  end

  def install
    bin.install "ccloud"
  end

  test do
    output = shell_output("#{bin}/ccloud version")
    assert_match "ccloud 0.10.0", output
  end
end
