class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.8.0/k8pk-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "8eb5bb404e7b095c38a2d4d743e96bd26a8cca23248b080e35c0e2ec39a44a0c"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.8.0/k8pk-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "e3e3547c1ce9d5e1f19ba312e7ef9e96a0c5ac123b086bb46a1122d962cefb44"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.8.0/k8pk-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a4c7aa53eff35411e904e2b5c4ba0912fab5a6d48b768d581c6b3c7a29916d59"
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
