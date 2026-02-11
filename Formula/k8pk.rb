class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "1.14.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.3/k8pk-v1.14.3-aarch64-apple-darwin.tar.gz"
      sha256 "996cde1e52add70539307f7e59993a6b1fef00f1f772bc44a0526bdd441896f1"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.3/k8pk-v1.14.3-x86_64-apple-darwin.tar.gz"
      sha256 "6edfe87b28e360be9b5dc3faf66c5c03285e07cbc7d8a33b5066ab92e7fb4b18"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.3/k8pk-v1.14.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "261ef9be42e8c74b0f5e8d563574d5f1ef17678e2d42500c40465662eb2fe6e1"
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
