class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "1.14.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.7/k8pk-v1.14.7-aarch64-apple-darwin.tar.gz"
      sha256 "5ee9fd3a3dcd038d343ee65590bc603c193cf14bf35270e0d5625b2e29241603"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.7/k8pk-v1.14.7-x86_64-apple-darwin.tar.gz"
      sha256 "6135c61e0f9d94e0dbe56879562309961404a539e33dd3ad4cac129693cef9f9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.7/k8pk-v1.14.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69e61fb3324b0510c5390da16e6f8b4c86b22c7637271d4ca5644cd82f52af3d"
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
