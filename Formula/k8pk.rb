class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.10.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.8/k8pk-v0.10.8-aarch64-apple-darwin.tar.gz"
      sha256 "8af3069e84bd2e95ec47a11ae7f0d8677ea31239f29dbe698e38fd5c8fa2f933"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.8/k8pk-v0.10.8-x86_64-apple-darwin.tar.gz"
      sha256 "522296c321999fbe1025c2287ec7de2f56c9db2c2ad6cf0bf8e87abc391b5f38"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.8/k8pk-v0.10.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e3ebd874d8f385eb274c1b315d7a26ac101588a359985d318ed36dd7a3d5ddfc"
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
