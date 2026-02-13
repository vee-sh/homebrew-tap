class KubeCopy < Formula
  desc "kubectl/oc plugin to copy Kubernetes resources across namespaces and clusters"
  homepage "https://github.com/vee-sh/kubecopy"
  version "v0.1.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vee-sh/kubecopy/releases/download/v0.1.4/kubectl-copy-darwin-arm64.tar.gz"
      sha256 "c35e952e9866558da40ca7524146c28281775b916cdf183411f30ed0382b2201"
    else
      url "https://github.com/vee-sh/kubecopy/releases/download/v0.1.4/kubectl-copy-darwin-amd64.tar.gz"
      sha256 "561a4fb7aac3228dfdb1176b368e3a72c09c000aceca88a6456437920541cace"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vee-sh/kubecopy/releases/download/v0.1.4/kubectl-copy-linux-arm64.tar.gz"
      sha256 "3f0107bfdb175a95434a9264d54ea8d54e938fee4b2bcef801dd51807bef25f9"
    else
      url "https://github.com/vee-sh/kubecopy/releases/download/v0.1.4/kubectl-copy-linux-amd64.tar.gz"
      sha256 "8ee8f84b286d679ec18046bea9a1779db04743d73f7daf0b96ca5d29dba13276"
    end
  end

  def install
    bin.install "kubectl-copy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kubectl-copy --version")
  end
end
