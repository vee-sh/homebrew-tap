class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.11.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.7/k8pk-v0.11.7-aarch64-apple-darwin.tar.gz"
      sha256 "f81e8f31ae52519b47aa22cdf09922e6c1ea5cf63b02c6836fef89148d1f8c56"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.7/k8pk-v0.11.7-x86_64-apple-darwin.tar.gz"
      sha256 "69270d3a80ed694d512c65bc89afb1139e0615bd8931b602ddee7dc2095ed67e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.7/k8pk-v0.11.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f3e80d4a9c20dd3166fd3a0f09578ab7ab19c36359538d2c7ffc8a0e0d913fc6"
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
