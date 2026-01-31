class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.11.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.6/k8pk-v0.11.6-aarch64-apple-darwin.tar.gz"
      sha256 "42973925a795816a6afbcaa4043f657c0fb1a7a10fbf7049b90168d5d7427521"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.6/k8pk-v0.11.6-x86_64-apple-darwin.tar.gz"
      sha256 "2db61faaf2d418868d7bf3c3e9f3c33e00d39687ee5710dcde4e8b534927605a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.6/k8pk-v0.11.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d8d83dd38cfc0bf8c34f5b599609e1cd2d9808fc318c5a849f8be702b8b9d1c"
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
