# Auto-generated file, DO NOT EDIT
# Source: release/ccloud-tmpl.rb

class Ccloud < Formula
  desc "CockroachDB Cloud CLI"
  homepage "https://www.cockroachlabs.com"
  version "0.9.0"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-amd64_0.9.0.tar.gz"
      sha256 "135908c1b7f9f5e55240f2952cd67d950f03e910583c0b735a20a410fd8d032d"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-arm64_0.9.0.tar.gz"
      sha256 "1fcb92e07464c747d9ea7ef5a9e666ad5b4ee6098ebe747c14db622196d53440"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_linux-amd64_0.9.0.tar.gz"
      sha256 "2126c92a04819d6657b5c8f49f87721aed0c2235ab1be0f1a510e5f7189e139b"
    end
  end

  def install
    bin.install "ccloud"
  end

  test do
    output = shell_output("#{bin}/ccloud version")
    assert_match "ccloud 0.9.0", output
  end
end
