class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.10.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.3/k8pk-v0.10.3-aarch64-apple-darwin.tar.gz"
      sha256 "9dcf74c0e92446c4caa19d5d4a3220085f52c46c265b3c492f545359d4868a35"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.3/k8pk-v0.10.3-x86_64-apple-darwin.tar.gz"
      sha256 "0a357ac4fc4bc1019d60b0c267ea0e20d90d8a807dd9da31fece9cb70ab384d7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.3/k8pk-v0.10.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e494205e593785c42dea1ebb7cce90ad1b7c517bc91aa148537846ac1837fff5"
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
