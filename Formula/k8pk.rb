class K8pk < Formula
  desc "Kubernetes context picker - cross-terminal k8s context/namespace switcher"
  homepage "https://github.com/vee-sh/k8pk"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.0/k8pk-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "c069ac6aea330b5f5052439bd49d2c3ef35acd3b45893c19e5ad26a92d569076"
    end
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.0/k8pk-v0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "bcfe5bb26215f6d093be3ff7be38eaceacb67a332210717a9157c8d097447ec1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/k8pk/releases/download/v0.11.0/k8pk-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dbc424797d918d5ff0db10c2e48449a98b6857d883237e362546ff3431007d94"
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
