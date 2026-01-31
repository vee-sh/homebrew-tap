class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.11.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.10/k8pk-v0.11.10-aarch64-apple-darwin.tar.gz"
      sha256 "bce2bddfb3a592c4350834aa9c9660d8749f3362504efd42182442daeefa5d63"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.10/k8pk-v0.11.10-x86_64-apple-darwin.tar.gz"
      sha256 "da25691f0cdf83b23336253cb46fb4b4653b7d12d0fd00f72fe9157c4b65572d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.10/k8pk-v0.11.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3da336c2721042b4e02cc7b690519aecc8be0153ffdc88ea55b1eeddc1aef5c7"
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
