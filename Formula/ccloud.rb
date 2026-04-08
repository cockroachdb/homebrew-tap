# Auto-generated file, DO NOT EDIT
# Source: release/ccloud-tmpl.rb

class Ccloud < Formula
  desc "CockroachDB Cloud CLI"
  homepage "https://www.cockroachlabs.com"
  version "0.8.21"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-amd64_0.8.21.tar.gz"
      sha256 "e8d76560d0aed1c7639b302bdad265360e88d6914643d7e6a46feb07bffff745"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-arm64_0.8.21.tar.gz"
      sha256 "a9d12634079cbd07b0b5a1b58c9dc06a3abdffc263feda317cae4bf11492822f"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_linux-amd64_0.8.21.tar.gz"
      sha256 "7bb4ffe6a227853838eea0aa446db68de4306af6a5987ba7e5b6ac0db60a7f7b"
    end
  end

  def install
    bin.install "ccloud"
  end

  test do
    output = shell_output("#{bin}/ccloud version")
    assert_match "ccloud 0.8.21", output
  end
end
