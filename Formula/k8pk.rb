class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "1.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.13.1/k8pk-v1.13.1-aarch64-apple-darwin.tar.gz"
      sha256 "7ee50ca073dfd62a4d6a1553a86f8af1387ea8f4d43aeaf3f96663c62413ed8c"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.13.1/k8pk-v1.13.1-x86_64-apple-darwin.tar.gz"
      sha256 "563696ca6ec8624f552f515267640bafb3b1bd7e4279f09463746c0785f4361e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.13.1/k8pk-v1.13.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "31c1bfbf2725caab62a23b2f1576dffd37b7d1c1ee447c66a5d578bcdce82507"
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
