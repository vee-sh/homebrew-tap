class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.11.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.8/k8pk-v0.11.8-aarch64-apple-darwin.tar.gz"
      sha256 "61676715b60a7fcfeaecf0ed0ec73727fb4623399eb3a86fca9e5636d978e5a4"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.8/k8pk-v0.11.8-x86_64-apple-darwin.tar.gz"
      sha256 "e1e4cb7f50bb5a49b57e9fb0b162a66c80fe9b86936cb440f3a9ed0e29fe97ef"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.8/k8pk-v0.11.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bca7f79c31e6ad878117d76097ad132a0cd58b36f059aa0302105b01270dd268"
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
