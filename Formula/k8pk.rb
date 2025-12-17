class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.9.0/k8pk-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "201b8393a24dad6ac18f640d3807e6bad784ea954fa4975d3a558779f1b4e5a7"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.9.0/k8pk-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "61cfba578a0552a3b660f9e7c75842189b048894c2f38eac5b54f1cdf5bcb405"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.9.0/k8pk-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dfc48811bcc3a4395b9b50b1dcefed0bfa7028e9375cf9161b4a23c08f8cca7a"
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
