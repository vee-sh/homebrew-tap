class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.1/k8pk-v0.10.1-aarch64-apple-darwin.tar.gz"
      sha256 "93a8351a3f6cb3396147bf39fc0d61720dd67c556869ad55086e0ca610fe44fe"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.1/k8pk-v0.10.1-x86_64-apple-darwin.tar.gz"
      sha256 "5d537edecf0bca4e258d8a2a479baf3e2cd44076e01b938c6c7d9650f1438d4a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.1/k8pk-v0.10.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c14af6336f67dbade21c68375ebd3cf8ab5f02ee0949f6998dde4b45c67fbcd2"
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
