class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "1.14.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.12/k8pk-v1.14.12-aarch64-apple-darwin.tar.gz"
      sha256 "b559a3084875735bc88e4430150eb2d9b16000dce15f2b0ff2d56368524d74a8"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.12/k8pk-v1.14.12-x86_64-apple-darwin.tar.gz"
      sha256 "36917ce546c8089ee79bef724a26fab843c13e4dad66b40f9e8c7c81ccbffcab"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.12/k8pk-v1.14.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e94141c6681d998f99284429d1ce18498b59e47e3641cbeaedef00a37a062501"
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
