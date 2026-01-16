class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.11.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.3/k8pk-v0.11.3-aarch64-apple-darwin.tar.gz"
      sha256 "693e3b6478a2e4473f02db87348dd81d4eeead7e00f0df6061b81171b574cd2c"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.3/k8pk-v0.11.3-x86_64-apple-darwin.tar.gz"
      sha256 "34b2bfef1f2c912ff5c41831c6d97c5360c450a2eda884332fafa2ddcd07c77f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.3/k8pk-v0.11.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9de25539b75c803ad6525347bd1c12a626d506428c86508131c80d290454ce86"
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
