class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.10.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.3/k8pk-v0.10.3-aarch64-apple-darwin.tar.gz"
      sha256 "fdd54ce275bcae856f323f413deab80d6323e280ebda245cf6063b4da6ce50a0"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.3/k8pk-v0.10.3-x86_64-apple-darwin.tar.gz"
      sha256 "9c633f5be282b493ef6ffabbebb1bc06502403fab146b5d97f0731ce07d186b1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.3/k8pk-v0.10.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b05568d07cfb5baea2b7520ece642eb70fc9e5a86eaa5a185166ee592257b9d0"
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
