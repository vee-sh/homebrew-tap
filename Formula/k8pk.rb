class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.10.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.2/k8pk-v0.10.2-aarch64-apple-darwin.tar.gz"
      sha256 "d35a615463f08ac57a9ad54efba3e67d0a7cd2ab09d08d2fe6381f28f3a510b8"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.2/k8pk-v0.10.2-x86_64-apple-darwin.tar.gz"
      sha256 "aeb2bd765b2af661fcfea06d6b932145e7e20f78ad7501b29ffbd82f0ba5fafc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.2/k8pk-v0.10.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aad283885bc6f42345a71a9087777ac9628da561cd01d5bf1bbe51f5a13e9c59"
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
