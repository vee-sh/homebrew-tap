class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "1.13.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.13.3/k8pk-v1.13.3-aarch64-apple-darwin.tar.gz"
      sha256 "0f831adee024e9e0b8e246e9607cdfc29c5557b76f5b9e5c4cd4c4cd3cbe3b87"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.13.3/k8pk-v1.13.3-x86_64-apple-darwin.tar.gz"
      sha256 "972d1723adb7f29c7ab3ab3d96544fe4f0ede174e3db4a73513e4ef36042c7ec"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.13.3/k8pk-v1.13.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6a3c0c91000ddf8f08c518a628b9b8c9dcaa74b7921dd8aeca0bf0236251a38e"
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
