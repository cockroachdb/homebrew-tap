# Auto-generated file, DO NOT EDIT
# Source: release/ccloud-tmpl.rb

class Ccloud < Formula
  desc "CockroachDB Cloud CLI"
  homepage "https://www.cockroachlabs.com"
  version "0.11.0"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-amd64_0.11.0.tar.gz"
      sha256 "9e64c2838f432719d1a004142a79393d432a51301d6f9825cbf387400bbc8cb6"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-arm64_0.11.0.tar.gz"
      sha256 "5106e08fe6d5a14954feea4d53bca736f4662432ae805cca6add35b513c01544"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_linux-amd64_0.11.0.tar.gz"
      sha256 "9b7ca7d230162849b30b1146d368f90117412799df4761ed02154ffd9bc962f9"
    end
  end

  def install
    bin.install "ccloud"
  end

  test do
    output = shell_output("#{bin}/ccloud version")
    assert_match "ccloud 0.11.0", output
  end
end
