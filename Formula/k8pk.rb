class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.8.1/k8pk-v0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "c4668def57b0237eada8f3f89c2ca00bb4ca663b522efaf22db201cae017bb84"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.8.1/k8pk-v0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "98e760bba37a69ad753d72db619619f9d06c52a44fdc14e94110b5e559951228"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.8.1/k8pk-v0.8.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e8ced8b02d0903db04c49c278341288778d56a5de396bac55aef6205e10c9ce6"
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
