class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "1.14.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.6/k8pk-v1.14.6-aarch64-apple-darwin.tar.gz"
      sha256 "e18b2d199254062044c56acd9538d68ba6235a7a18c8a463995cbe078dc427cf"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.6/k8pk-v1.14.6-x86_64-apple-darwin.tar.gz"
      sha256 "c7445a64268a634af1b43dfce484de62ad13b8f2449be0b4911c130f352bc1a6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.6/k8pk-v1.14.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e73d8fdabf111277445623c1d34022cac1272c28b3d9bbfc47104438e8009bc"
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
