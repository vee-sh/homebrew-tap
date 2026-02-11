class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "1.13.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.13.2/k8pk-v1.13.2-aarch64-apple-darwin.tar.gz"
      sha256 "3d580d0640ed25d4cb9347ce71676f0436b007639b7ae55d86a43e0c71040dea"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.13.2/k8pk-v1.13.2-x86_64-apple-darwin.tar.gz"
      sha256 "36475fb0aa7b28781fdf68b1a18849074f38ce47d2bddb26929b9c5e2b3f2f04"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.13.2/k8pk-v1.13.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "92d009b11aef81b521a616ac673c6912463f00d0a2e4ac0ad650a9f25a2cd115"
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
