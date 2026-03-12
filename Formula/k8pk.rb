class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "1.14.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.13/k8pk-v1.14.13-aarch64-apple-darwin.tar.gz"
      sha256 "bd4c4008815135457e8149213fa0ffad05c3a1068a13178ed399fac692d54100"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.13/k8pk-v1.14.13-x86_64-apple-darwin.tar.gz"
      sha256 "9303534da12f5347a7ed303554c70e41818f195cc2c97169e47e20b8d19589b8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.13/k8pk-v1.14.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6131b8144c7b0c37283dd70e0eb629bf2314d59a70b534a9b306f48d18a4a8ec"
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
