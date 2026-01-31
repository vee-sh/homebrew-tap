class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.11.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.9/k8pk-v0.11.9-aarch64-apple-darwin.tar.gz"
      sha256 "a309ea661e2a7dbd446302a670a13d3de144726c5b554c55ef513d74685212c0"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.9/k8pk-v0.11.9-x86_64-apple-darwin.tar.gz"
      sha256 "d0c0dbf574ede13422a5aa5a7a70db28831012a14c83ab4f123b735271b88a89"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.9/k8pk-v0.11.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "33d6e51d491b503617a4a5a4ec0ef5977df0a9aa0864724d67ca36824f16772a"
    end
  end

  def install
    bin.install "k8pk"
    (share/"k8pk/shell").install "shell/k8pk.sh" if File.exist?("shell/k8pk.sh")
    (share/"k8pk/shell").install "shell/k8pk.fish" if File.exist?("shell/k8pk.fish")
    generate_completions_from_executable(bin/"k8pk", "completions")
  end

  def caveats
    <<~EOS
      Add to your shell config:
        bash/zsh: source #{share}/k8pk/shell/k8pk.sh
        fish:     source #{share}/k8pk/shell/k8pk.fish
    EOS
  end

  test do
    assert_match "k8pk", shell_output("#{bin}/k8pk --version")
  end
end
