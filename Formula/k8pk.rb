class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.10.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.14/k8pk-v0.10.14-aarch64-apple-darwin.tar.gz"
      sha256 "5b315b6515314f4ecb0d68b80d10bfe660ed2d154d2dc38e9caf8a01ee859a86"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.14/k8pk-v0.10.14-x86_64-apple-darwin.tar.gz"
      sha256 "6fce4033dd1deab14104519a2bcfc04bfc16772544e6a1a56f0f89919cc83fa6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.14/k8pk-v0.10.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f0ea75f01d62ff4f92acf71a75087d0959fdbef898dc9a4c29f7fab0e34090b"
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
