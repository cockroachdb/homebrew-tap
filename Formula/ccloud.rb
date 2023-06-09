# Auto-generated file, DO NOT EDIT
# Source: release/ccloud-tmpl.rb

class Ccloud < Formula
  desc "CockroachDB Cloud CLI"
  homepage "https://www.cockroachlabs.com"
  version "0.4.8"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-amd64_0.4.8.tar.gz"
      sha256 "e3b1a7177a2a253aa51aa5f6e12ead5d5818a9c6824f7fa18387168df31ed60b"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-arm64_0.4.8.tar.gz"
      sha256 "1ac9fdc934efc37de2c94807ec39c5eb83d0d22658f4dadecf90fe425f6e1a66"
    end
  end

  def install
    bin.install "ccloud"
  end

  test do
    output = shell_output("#{bin}/ccloud version", 0)
    assert_match "ccloud 0.4.8", output
  end
end

