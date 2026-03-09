# Auto-generated file, DO NOT EDIT
# Source: release/ccloud-tmpl.rb

class Ccloud < Formula
  desc "CockroachDB Cloud CLI"
  homepage "https://www.cockroachlabs.com"
  version "0.8.18"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-amd64_0.8.18.tar.gz"
      sha256 "16feacdeb3757737d55f4b2226f31f5ea613426a2d903d73c6e0de59ed5b4e43"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-arm64_0.8.18.tar.gz"
      sha256 "92ec5b36967c751025b7cdce6cd07dce933e211f82c68edaf3260615f0011410"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_linux-amd64_0.8.18.tar.gz"
      sha256 "4ed5bf9fd783bc849bd67baae4ff60b6ac265d2ad4d014fe59612fd751f8893b"
    end
  end

  def install
    bin.install "ccloud"
  end

  test do
    output = shell_output("#{bin}/ccloud version")
    assert_match "ccloud 0.8.18", output
  end
end
