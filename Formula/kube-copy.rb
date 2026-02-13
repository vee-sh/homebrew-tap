class KubeCopy < Formula
  desc "kubectl/oc plugin to copy Kubernetes resources across namespaces and clusters"
  homepage "https://github.com/vee-sh/kubecopy"
  version "v0.1.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vee-sh/kubecopy/releases/download/v0.1.2/kubectl-copy-darwin-arm64.tar.gz"
      sha256 "0ed2817c4bd67ba2dee58890a63265f289efec66b25ea01aa2779b1a1a1b12ef"
    else
      url "https://github.com/vee-sh/kubecopy/releases/download/v0.1.2/kubectl-copy-darwin-amd64.tar.gz"
      sha256 "cb377d22a84bc1f22959bdd5e42f3f68b609ba6e8544ac4fb9a45591245ad0d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vee-sh/kubecopy/releases/download/v0.1.2/kubectl-copy-linux-arm64.tar.gz"
      sha256 "053cbb7198bb30ac6fa9b1eace9b407b32dde45423632f509002fe3e96c2a655"
    else
      url "https://github.com/vee-sh/kubecopy/releases/download/v0.1.2/kubectl-copy-linux-amd64.tar.gz"
      sha256 "d003c17bbbc0731b5a7ca3b3151c90afd9323aeb44ead007febe23601c072cc1"
    end
  end

  def install
    bin.install "kubectl-copy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kubectl-copy --version")
  end
end
