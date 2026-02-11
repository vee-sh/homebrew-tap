class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "1.14.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.4/k8pk-v1.14.4-aarch64-apple-darwin.tar.gz"
      sha256 "b3492b3c17e8787eb28083e3f8bad61f4708aa85159a843b476884efe63aa891"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.4/k8pk-v1.14.4-x86_64-apple-darwin.tar.gz"
      sha256 "00f9285840165110bd5e0ec9f98d6ed1a8bb6120698c391f465f480eadf1cd56"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.4/k8pk-v1.14.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4fcf6a38f30efd555470f465a8475bd7f04cbd882fbc6c83d8a384919e0f6cf5"
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
