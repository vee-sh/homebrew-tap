class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "1.14.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.8/k8pk-v1.14.8-aarch64-apple-darwin.tar.gz"
      sha256 "eb8bb5e7d4a58d6593c34ceea81eab71d17b1255b030f201fbf1a0db9797f4e1"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.8/k8pk-v1.14.8-x86_64-apple-darwin.tar.gz"
      sha256 "a0ce016e9285034ace0a0c71c3b82ad99d518c63013f1057dea3730466136545"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.8/k8pk-v1.14.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dc319dedd5ceddb89534dff42676a709efd176c3257022f55fdb0e535e15ad73"
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
