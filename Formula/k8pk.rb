class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.11.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.11/k8pk-v0.11.11-aarch64-apple-darwin.tar.gz"
      sha256 "c9148092279554cb616c5a77b6fd190556aa9884562b75d2e7688443c9e7246d"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.11/k8pk-v0.11.11-x86_64-apple-darwin.tar.gz"
      sha256 "4b9d32f3034336c453e7236301c0c1586d1c1eac2ff7deb54753ab93fd8fb498"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.11/k8pk-v0.11.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8f18c8b0c23a5aa3ccf81c5ac4f2800c992e7e96ac504dc5bd69bec96aafea3f"
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
