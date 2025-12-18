class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.10.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.4/k8pk-v0.10.4-aarch64-apple-darwin.tar.gz"
      sha256 "3afe4d9ea47e0401f8b36460db572088081ffc12c1d6d32d51224fcc7c460234"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.4/k8pk-v0.10.4-x86_64-apple-darwin.tar.gz"
      sha256 "5e0235372e4ca756b6019d16585949a9aea57f8f8374592fa1e999deebe71b46"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.4/k8pk-v0.10.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "776c24fe94c3933bde337cb37c51a78f8fc4d4786bfdb581dee5331995063e2c"
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
