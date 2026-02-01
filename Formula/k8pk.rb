class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.12.0/k8pk-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "53dfcd7b4c9fa3b17204e059dadc7cce32e8c14f82c04eb86e68411593cca621"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.12.0/k8pk-v0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "6409dba33824db9ea643be24f3a5814287d43bc8c0148f3ae8679831660eeb7a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.12.0/k8pk-v0.12.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2fafc6510305e55084db9ba7ebccb34020bf266274f41bcefd210fc1b849829d"
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
