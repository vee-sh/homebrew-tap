class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "1.14.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.5/k8pk-v1.14.5-aarch64-apple-darwin.tar.gz"
      sha256 "a0b5f302119c043c27e70d210c1c4e318e6278c6666291694dff0369a3503995"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.5/k8pk-v1.14.5-x86_64-apple-darwin.tar.gz"
      sha256 "14b6e9d198efdef81690fb00cedf8d20466de22c6a2e2102c4b974bb2c868f11"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.5/k8pk-v1.14.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1faec63ab23e2fcfebbbefd8366f5565efcb92080a5ca4f5ccac04c3433a4042"
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
