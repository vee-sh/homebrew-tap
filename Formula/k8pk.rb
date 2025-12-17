class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.9.0/k8pk-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.9.0/k8pk-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "ea2bf53e725a6025d20f8d138a26a738c9b478ed191cf392fce35321073613d7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.9.0/k8pk-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8cad88c051dae681f0b806436cf18ea7df3ffa227c5f03d802d2d1ba00e658ef"
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
