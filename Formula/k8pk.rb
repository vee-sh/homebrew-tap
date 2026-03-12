class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "1.14.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.11/k8pk-v1.14.11-aarch64-apple-darwin.tar.gz"
      sha256 "116429f78f66903c2a658781c89cab2dc7603259c06da98f2d75c42477698cdc"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.11/k8pk-v1.14.11-x86_64-apple-darwin.tar.gz"
      sha256 "17860704801cf21df5b41f2ff19cc5c186a1bb340f71dde829ef92e384a6e5ff"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v1.14.11/k8pk-v1.14.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d444953ce02534adfaf15bdfdba15f11566f9d545920c1ca3684177927d81d52"
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
