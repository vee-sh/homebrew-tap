class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "1.14.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.10/k8pk-v1.14.10-aarch64-apple-darwin.tar.gz"
      sha256 "2e6a2656445bb61529ccc61be47e0bc83a06379e1171a87c00e4541ae01073c7"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.10/k8pk-v1.14.10-x86_64-apple-darwin.tar.gz"
      sha256 "a9aefd2cb3617a4852c5359c8b99cf87fe816c9965b1f703fde99604fd909523"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.10/k8pk-v1.14.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6e1e17cddc5a226ef5e478deb3ef05267734e0766e3b1ba43acb1ca93e430376"
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
