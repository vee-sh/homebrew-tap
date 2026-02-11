class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "1.14.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.1/k8pk-v1.14.1-aarch64-apple-darwin.tar.gz"
      sha256 "16b620694c6e7eb7331c407b6f19602acac909aed5b5c776773ea4f40d2d4558"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.1/k8pk-v1.14.1-x86_64-apple-darwin.tar.gz"
      sha256 "57cd5c1fb2a4b70263be854db1c0b9ab38283d49aa9d8e688783fd41901b5222"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.1/k8pk-v1.14.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b7f76ae651c0d0e274b050ecd16d332500e9f3c623637d8fbbd4bc420aa03a36"
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
