class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.10.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.5/k8pk-v0.10.5-aarch64-apple-darwin.tar.gz"
      sha256 "97a74a8a74db517bd726277b6d3d511237ecaa35f541e782a3396398ca6a8e98"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.5/k8pk-v0.10.5-x86_64-apple-darwin.tar.gz"
      sha256 "35abb2134a625dc88afcedf660e3fcf37dff37a0a9f7de7b347d1074150d7ec1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.10.5/k8pk-v0.10.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e36d0c6c16a82daa5e77a661dfce11a8995a77855480790a4e874dec0d292306"
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
