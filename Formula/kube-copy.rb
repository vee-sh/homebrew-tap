class KubeCopy < Formula
  desc "kubectl/oc plugin to copy Kubernetes resources across namespaces and clusters"
  homepage "https://github.com/vee-sh/kube-copy"
  version "v0.1.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vee-sh/kube-copy/releases/download/v0.1.5/kubectl-copy-darwin-arm64.tar.gz"
      sha256 "b30b8c4df57a51aa170cf38c07cefc67ac14319276a1ab24fd00b57dd157f6cd"
    else
      url "https://github.com/vee-sh/kube-copy/releases/download/v0.1.5/kubectl-copy-darwin-amd64.tar.gz"
      sha256 "f4ab93d3a1bb8ded59224900b6e347d7925d997ec81a9e0a8659442abda8d7a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vee-sh/kube-copy/releases/download/v0.1.5/kubectl-copy-linux-arm64.tar.gz"
      sha256 "a11d90ba52b1a28cb5f31dcedb44b1315391bae2322da12186d66114c4f720fb"
    else
      url "https://github.com/vee-sh/kube-copy/releases/download/v0.1.5/kubectl-copy-linux-amd64.tar.gz"
      sha256 "6f2da68cf5df4338edb6b7f3636ccbcb82e57cafc2e568d4e9c435c4f89c39b0"
    end
  end

  def install
    bin.install "kubectl-copy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kubectl-copy --version")
  end
end
