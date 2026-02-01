class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.12.0/k8pk-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "8e23f5b11e9c5f5e7867bedfed0ed9374ef34eb56483e9564dbad244bfc907af"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.12.0/k8pk-v0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "a20030f02ef9d741b0bda08e1e274374385b2692f6c60911ce9b037b85c088eb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.12.0/k8pk-v0.12.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f30d808207fea343d079c5eac62bdc8b30016ffd84ccca2822ca299f9ba80c3b"
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
