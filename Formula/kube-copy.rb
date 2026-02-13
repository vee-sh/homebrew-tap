class KubeCopy < Formula
  desc "kubectl/oc plugin to copy Kubernetes resources across namespaces and clusters"
  homepage "https://github.com/vee-sh/kubecopy"
  version "v0.1.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vee-sh/kubecopy/releases/download/v0.1.3/kubectl-copy-darwin-arm64.tar.gz"
      sha256 "a356b0fe24a7947c0872d8484501dd966358d6bb755bdbc12b5756d3f25ff4e0"
    else
      url "https://github.com/vee-sh/kubecopy/releases/download/v0.1.3/kubectl-copy-darwin-amd64.tar.gz"
      sha256 "abc18988b4721e2cbe24231a377ef7f3287146da908aac4a8335a20301ceb829"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vee-sh/kubecopy/releases/download/v0.1.3/kubectl-copy-linux-arm64.tar.gz"
      sha256 "a9495de553e3f50806248f6cd0a1a00b5e7d7b8109a6b52e15c7bc5381f409b3"
    else
      url "https://github.com/vee-sh/kubecopy/releases/download/v0.1.3/kubectl-copy-linux-amd64.tar.gz"
      sha256 "b0c7b8f48b90d877e8ef6555737f1b7564a4b294eca8bb7573f766fa5a032fb3"
    end
  end

  def install
    bin.install "kubectl-copy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kubectl-copy --version")
  end
end
