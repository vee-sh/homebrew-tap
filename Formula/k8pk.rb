class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "1.13.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.13.2/k8pk-v1.13.2-aarch64-apple-darwin.tar.gz"
      sha256 "8b0039279ebf7e02d824a3c52b0f4810ceaffbf9fc3d2d1bd63993cb49f71296"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.13.2/k8pk-v1.13.2-x86_64-apple-darwin.tar.gz"
      sha256 "5445fb9ff65b61b3f4dfddf1d6ca4f7a4afe37234776c32ba81d69f68e2b42e6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.13.2/k8pk-v1.13.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8bbb9ce0c1bc3dbace068a3d1847a326befd3336831d40997f7fe244b8784ba6"
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
