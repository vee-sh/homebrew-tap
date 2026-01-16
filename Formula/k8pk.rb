class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.1/k8pk-v0.11.1-aarch64-apple-darwin.tar.gz"
      sha256 "dfeff4f4f852271fdfedf5c829b00dc336b0daa49cb594a74d1f645085c98b0e"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.1/k8pk-v0.11.1-x86_64-apple-darwin.tar.gz"
      sha256 "8717838f926fdafa45cb1f737f84acdcb98b652eb4034b904616c98bcd6acbfd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.1/k8pk-v0.11.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b7316b829370552b3041604d12713fe883dbba3ab8ab07f952bab1073feb90b0"
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
