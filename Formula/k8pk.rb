class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "1.14.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.9/k8pk-v1.14.9-aarch64-apple-darwin.tar.gz"
      sha256 "b66e18dd7da0d655458a730510ea3f22cbb88f067ac48120f9aaf9370c651c4f"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.9/k8pk-v1.14.9-x86_64-apple-darwin.tar.gz"
      sha256 "eeaeec75055ae50d12af3e3eb8c50406d4ee8a2d4ed0476460f4a8c799648b45"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.9/k8pk-v1.14.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d70ef4b2280f21fe1479ddc118ecf685c13e129c8d3665eac515300cb6095f04"
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
