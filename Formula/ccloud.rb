# Auto-generated file, DO NOT EDIT
# Source: release/ccloud-tmpl.rb

class Ccloud < Formula
  desc "CockroachDB Cloud CLI"
  homepage "https://www.cockroachlabs.com"
  version "0.8.23"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-amd64_0.8.23.tar.gz"
      sha256 "28db7b8de8d86c1153b39a9d265b525f2e5ea3c5b95042bc9b79c8091a0df221"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-arm64_0.8.23.tar.gz"
      sha256 "1aef1d7890b6a9ef7b46df3bf020656f2220619215187cc7f121495c8dc23cc6"
    end
  end

  on_linux do
    on_intel do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_linux-amd64_0.8.23.tar.gz"
      sha256 "fa0201a0a76d352038a893c1c8f4a0518621735131d7967fb5289560d6308a00"
    end
  end

  def install
    bin.install "ccloud"
  end

  test do
    output = shell_output("#{bin}/ccloud version")
    assert_match "ccloud 0.8.23", output
  end
end
