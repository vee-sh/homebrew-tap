class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.11.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.4/k8pk-v0.11.4-aarch64-apple-darwin.tar.gz"
      sha256 "62bc7768318ffd9c33729d39ab6c65d563b2a2d7568639fd55dab2658b0f0462"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.4/k8pk-v0.11.4-x86_64-apple-darwin.tar.gz"
      sha256 "fd521a52e44362676b0ee26907105d5d2480fc90fe76f85d35f6630c365f7fe2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.4/k8pk-v0.11.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f0e86f85fae695f5bed689da7aeea449723b8989ffaceed61b3cd2ffd5758d65"
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
