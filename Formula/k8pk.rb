class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.6.2/k8pk-v0.6.2-aarch64-apple-darwin.tar.gz"
      sha256 "f13c3ce16a5e137fe36380537d7b366bdf769071824ae19645e5ea5dfd8c4242"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.6.2/k8pk-v0.6.2-x86_64-apple-darwin.tar.gz"
      sha256 "c3de29fe1e3cebc9a8b7457c1bdd605da0bb7bfe68804bc2631130989b4903ae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.6.2/k8pk-v0.6.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "365dc5ec3505183b9d88657634195250986b8ac6a24b717df89401799d7322a3"
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
