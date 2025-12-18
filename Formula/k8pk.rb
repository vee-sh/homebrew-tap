class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.0/k8pk-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "6e50e3eaa0763b7caeb618ca0615bfc23a570725dafa2bf040c8e0aaae4cbb78"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.0/k8pk-v0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "366aa6d90ccfee28095def9a05d42b613c8cfe759f4163982a26e7cbcfa10615"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.0/k8pk-v0.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1d58b31ed7acd819be6c9d78ac555a224e64e0b2da4f5b6491d0ca44a29a77bb"
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
