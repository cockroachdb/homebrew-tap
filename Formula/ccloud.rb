# Auto-generated file, DO NOT EDIT
# Source: release/ccloud-tmpl.rb

class Ccloud < Formula
  desc "CockroachDB Cloud CLI"
  homepage "https://www.cockroachlabs.com"
  version "0.4.9"

  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-amd64_0.4.9.tar.gz"
      sha256 "68b762bdcc82392356d3c73b12d809e697d0701c54227bd6a8516d80ab86ce2f"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-arm64_0.4.9.tar.gz"
      sha256 "a7be7d58cbc944316234ab5f8f878904b7ea5b765b7785058e9b420088514838"
    end
  end

  def install
    bin.install "ccloud"
  end

  test do
    output = shell_output("#{bin}/ccloud version", 0)
    assert_match "ccloud 0.4.9", output
  end
end

