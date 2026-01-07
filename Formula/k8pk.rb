class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.10.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.13/k8pk-v0.10.13-aarch64-apple-darwin.tar.gz"
      sha256 "55df6e7b26bacd7edc326ea14a42cef1ffd65e51ca2824c2c144f59cf5aa99bf"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.13/k8pk-v0.10.13-x86_64-apple-darwin.tar.gz"
      sha256 "8bd8e1554f6ad8d54d552921efb890627d867fe1b9bb43a1613fd90168a9ff89"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.13/k8pk-v0.10.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5f4ae75e822299670b3fc0c727aaf09947132dedb1880ffda7b9ce9a650ca4d3"
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
