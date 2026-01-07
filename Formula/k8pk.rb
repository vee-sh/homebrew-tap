class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.10.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.10/k8pk-v0.10.10-aarch64-apple-darwin.tar.gz"
      sha256 "3bec009405e4791b4c84ff92fe0e671a79520e27489fb7e3a07185e1a735f480"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.10/k8pk-v0.10.10-x86_64-apple-darwin.tar.gz"
      sha256 "287978786c9ca13aaa8eff2387a10c356e023bcbdcd4196eea93eb8d1d50a19d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.10/k8pk-v0.10.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7329378411c7528774471fab26c268f6f2833de7c70e2c4087e7fe88be6ecc0a"
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
