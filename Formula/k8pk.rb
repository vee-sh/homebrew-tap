class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.12.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.12.1/k8pk-v0.12.1-aarch64-apple-darwin.tar.gz"
      sha256 "426d49151089c9c61ede74cd4196dcff064fe88192dde2e71b39f145ea62f503"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.12.1/k8pk-v0.12.1-x86_64-apple-darwin.tar.gz"
      sha256 "2d6213a6d413465602202efb2e688a2e10bf57ed8a87ca9a460b17f17f216ace"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.12.1/k8pk-v0.12.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "970f3da183ddbe08f800aaf77845cd551cdd4821538f9cd3afe014b609bf2e09"
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
