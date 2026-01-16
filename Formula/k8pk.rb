class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.11.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.2/k8pk-v0.11.2-aarch64-apple-darwin.tar.gz"
      sha256 "768755e0f1060ca8a1c1ddd45e6938b19cb0a39a3e31812ef868fc3118fd6d9a"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.2/k8pk-v0.11.2-x86_64-apple-darwin.tar.gz"
      sha256 "9b461d9c14953a06adef78aee558ed91a55c821ad75ee869c3d11259d59e0bf9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.2/k8pk-v0.11.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b4a2af6211d010c2d5b7a6687246046718a9c24d656ae50fd5a07b41bfe3cb07"
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
