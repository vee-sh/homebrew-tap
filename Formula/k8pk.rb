class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "1.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.13.0/k8pk-v1.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "aaed85f436f5a536d500a92da1761ec36159fb7786239d24a078adefdeb4cecf"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.13.0/k8pk-v1.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "4031f1111cbf1357d7ebf920e3f6987389dbd8212c64025000c36b087d7261dc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.13.0/k8pk-v1.13.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e996240d5a578d3f39ab9a38354e1e1fad71b92a5145451c89cb6a7573a87754"
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
