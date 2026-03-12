class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "1.14.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.14/k8pk-v1.14.14-aarch64-apple-darwin.tar.gz"
      sha256 "ce92cf26f880fce734afed3e27936cd7b9c6f700b3840ee840ebd78207479cd7"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.14/k8pk-v1.14.14-x86_64-apple-darwin.tar.gz"
      sha256 "479fce144eab38a8de269b52f2bf82f5dd676272725f91d40d2af5c53d1d55a3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.14/k8pk-v1.14.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5638eae2a0e9c8505e7274b5b5278e76433e39c29e589d4d707ef490571a43c2"
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
