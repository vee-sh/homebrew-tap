class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.11.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.12/k8pk-v0.11.12-aarch64-apple-darwin.tar.gz"
      sha256 "763641de1df751cb744b9f1bd81c3f8dc9a8469e642ddb564d3b230ad19b4f33"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.12/k8pk-v0.11.12-x86_64-apple-darwin.tar.gz"
      sha256 "a063311c33208423f00d9e0803d2931040355cb13ff4cc7dfbc5329754beb0a7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.12/k8pk-v0.11.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ed13336f5ddaec860b035be1acdcedda145cf935cd0d83dd5d87eb49e11fd17f"
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
