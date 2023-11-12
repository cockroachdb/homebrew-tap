# Auto-generated file, DO NOT EDIT
# Source: release/cockroach-tmpl.rb

class Cockroach < Formula
  desc "Distributed SQL database"
  homepage "https://www.cockroachlabs.com"
  version "23.1.11"
  on_linux do
    url "https://binaries.cockroachdb.com/cockroach-v23.1.11.linux-amd64.tgz"
    sha256 "https://binaries.cockroachdb.com/cockroach-v23.1.11.linux-amd64.tgz.sha256sum"
  end
  on_macos do
    on_intel do
      url "https://binaries.cockroachdb.com/cockroach-v23.1.11.darwin-10.9-amd64.tgz"
      sha256 "630134ae2ee5c77963930976ee5be6603f8c5d7b814626c14a70c85636639fbf"
    end
    on_arm do
      url "https://binaries.cockroachdb.com/cockroach-v23.1.11.darwin-11.0-arm64.tgz"
      sha256 "1d74acf5e6fef1d7f959b1b6408cbfe66def8a08fa6f49aebf55345589194637"
    end
  end

  def install
    bin.install "cockroach"

    system "#{bin}/cockroach", "gen", "man", "--path=#{man1}"

    bash_completion.mkpath
    system "#{bin}/cockroach", "gen", "autocomplete", "bash", "--out=#{bash_completion}/cockroach"

    zsh_completion.mkpath
    system "#{bin}/cockroach", "gen", "autocomplete", "zsh", "--out=#{zsh_completion}/_cockroach"
  end

  def caveats; <<~EOS
    For local development only, this formula ships a launchd configuration to
    start a single-node cluster that stores its data under:
      #{var}/cockroach/
    Instead of the default port of 8080, the node serves its admin UI at:
      #{Formatter.url("http://localhost:26256")}

    Do NOT use this cluster to store data you care about; it runs in insecure
    mode and may expose data publicly in e.g. a DNS rebinding attack. To run
    CockroachDB securely, please see:
      #{Formatter.url("https://www.cockroachlabs.com/docs/stable/secure-a-cluster.html")}
  EOS
  end

end

