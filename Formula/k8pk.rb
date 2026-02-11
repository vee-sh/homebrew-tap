class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "1.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.0/k8pk-v1.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "026d2a2f34e57ba0905481aee0345444075406a23b2e79284625781b566559e7"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.0/k8pk-v1.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "130c1a7cadf947e03a4cd05a26f506c5b95178cc6c92d10d411923787ec1378d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.0/k8pk-v1.14.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f6113b658a327f6dac6ed51492b88250eb7566cbae46b693aa7399752d5f7f03"
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
