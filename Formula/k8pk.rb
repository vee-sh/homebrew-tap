class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.11.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.8/k8pk-v0.11.8-aarch64-apple-darwin.tar.gz"
      sha256 "a4212ceb4293c16fe0fbf323beaa849408cf6150453715eeb5a9f94e43f5c0c8"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.8/k8pk-v0.11.8-x86_64-apple-darwin.tar.gz"
      sha256 "cd435b9030577cd4d2e7e0b095e655809d663d18458e6cf3afd8f16aeab0fb9f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.8/k8pk-v0.11.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f590ed08e7e61a8b34e235d3c704d5cb96e85224a517f05925c73c2b98a5e66"
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
