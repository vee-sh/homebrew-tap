class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.8.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.8.2/k8pk-v0.8.2-aarch64-apple-darwin.tar.gz"
      sha256 "6080764cbdd899e433d13659c3c163966757019922e293920e8583a4f7e2f292"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.8.2/k8pk-v0.8.2-x86_64-apple-darwin.tar.gz"
      sha256 "42ef0f27ff031ce5178a77be3ac73762a6ed37eac537ac5bc0ef8d9d0974254f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.8.2/k8pk-v0.8.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cfee0c9ae6bf49b157d9aa1c2f81ea56cd7b19f2e2fe2a5fee9e7691e59e3af9"
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
