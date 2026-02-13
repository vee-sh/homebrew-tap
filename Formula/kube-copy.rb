class KubeCopy < Formula
  desc "kubectl/oc plugin to copy Kubernetes resources across namespaces and clusters"
  homepage "https://github.com/vee-sh/kubecopy"
  version "v0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vee-sh/kubecopy/releases/download/v0.1.1/kubectl-copy-darwin-arm64.tar.gz"
      sha256 "5daf14ce6fe5230b56b0cca23181faec57dbc011af68b2efb9694f6a2b567393"
    else
      url "https://github.com/vee-sh/kubecopy/releases/download/v0.1.1/kubectl-copy-darwin-amd64.tar.gz"
      sha256 "1df9fad63d88356a43d75855964adb9dc9626badf15cf47a618c07de382fb792"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vee-sh/kubecopy/releases/download/v0.1.1/kubectl-copy-linux-arm64.tar.gz"
      sha256 "1e224b175ecf0b40d28fe69bffae8df7688d0d0b8c20da7d687bda7e3d724d1d"
    else
      url "https://github.com/vee-sh/kubecopy/releases/download/v0.1.1/kubectl-copy-linux-amd64.tar.gz"
      sha256 "f10f3daa19206682c140e0e6f147fd97374d413840d84882169a3b144e3e1398"
    end
  end

  def install
    bin.install "kubectl-copy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kubectl-copy --version")
  end
end
