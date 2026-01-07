class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.10.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.11/k8pk-v0.10.11-aarch64-apple-darwin.tar.gz"
      sha256 "c0aff17951741185df9255173c311f1d498380822952e12899ce90b474041557"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.11/k8pk-v0.10.11-x86_64-apple-darwin.tar.gz"
      sha256 "f4ca3c65d7017fb79cc0faecd0e71e0bf3bc13e3710793261cb1c92d45b2b4b4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.11/k8pk-v0.10.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "36964a2e6fddc8b373ccf3a8832acb08f17daa3a09d72d2a89ada8885551ee6b"
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
