class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.12.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.12.2/k8pk-v0.12.2-aarch64-apple-darwin.tar.gz"
      sha256 "628718664bf2c42a0a8f9fb736179dd00225c49f73dbb35801252c024a9fc4bf"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.12.2/k8pk-v0.12.2-x86_64-apple-darwin.tar.gz"
      sha256 "73db36570744b55bcaa4d1cd6893be5bba64828f745b059f5a15fbe126073e72"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.12.2/k8pk-v0.12.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "550bfb03804b5e41c4e093eedc7a9e7732987946a2707247334a7c91a8a80841"
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
