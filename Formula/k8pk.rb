class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.10.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.7/k8pk-v0.10.7-aarch64-apple-darwin.tar.gz"
      sha256 "17a2f985f5f8fd1a3629785cf8a7b344a3b188e34194736c36e88dcc08f359c2"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.7/k8pk-v0.10.7-x86_64-apple-darwin.tar.gz"
      sha256 "d380ffdf209c64496cc84beb2592ba8ba0437a607b2fa4a3afe22a7baa0b0b4f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.7/k8pk-v0.10.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "91c6647ebef7b8d5355e9663f962024e7af8a9ed2246bfa5c2068c2b3964ca3c"
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
