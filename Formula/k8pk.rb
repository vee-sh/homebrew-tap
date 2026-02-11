class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "1.14.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.2/k8pk-v1.14.2-aarch64-apple-darwin.tar.gz"
      sha256 "32da3ef7bf6b5ce77a1d52fa46f0adea8b617e26bb41d1d0677979c39394414a"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.2/k8pk-v1.14.2-x86_64-apple-darwin.tar.gz"
      sha256 "3645583f27e93897928a69957f09082c8c3f174412728193d56bb1a1a0c86130"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.2/k8pk-v1.14.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c52608a0643e9eb982f73c99a411cc4b9700411b93b089dc9938ca382c0057be"
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
