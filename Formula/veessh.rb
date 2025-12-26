# typed: false
# frozen_string_literal: true

class Veessh < Formula
  desc "Console connection manager for SSH/SFTP/Telnet/Mosh/SSM/GCloud"
  homepage "https://github.com/vee-sh/veessh"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/vee-sh/veessh/releases/download/v#{version}/veessh_v#{version}_darwin_amd64.tar.gz"
      sha256 "a18289f223bac575f0f0db261bfc6eac0c4a01af8b820778e0a27ca899c8d106"
    end

    on_arm do
      url "https://github.com/vee-sh/veessh/releases/download/v#{version}/veessh_v#{version}_darwin_arm64.tar.gz"
      sha256 "6ceb6f67d4aa552d46e1db3db8084113768fcbaed0c7005470be91fb6b53dabd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/veessh/releases/download/v#{version}/veessh_v#{version}_linux_amd64.tar.gz"
      sha256 "86f418044597cdb1a2fd8b953fc9399bc5ccf8e622ac257ad58b4dbe80d074a6"
    end

    on_arm do
      url "https://github.com/vee-sh/veessh/releases/download/v#{version}/veessh_v#{version}_linux_arm64.tar.gz"
      sha256 "af4fa773ae26cc37ea8633c37bcca223a829e30c136179bd30e0918e2568e2ac"
    end
  end

  def install
    bin.install "veessh"

    # Install shell completions
    generate_completions_from_executable(bin/"veessh", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/veessh --version")
  end
end
