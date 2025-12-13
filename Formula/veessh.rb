# typed: false
# frozen_string_literal: true

class Veessh < Formula
  desc "Console connection manager for SSH/SFTP/Telnet/Mosh/SSM/GCloud"
  homepage "https://github.com/vee-sh/veessh"
  version "0.4.1"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/vee-sh/veessh/releases/download/v#{version}/veessh_v#{version}_darwin_amd64.tar.gz"
      sha256 "b84e4f58ddeef647ccafeace877308f134e25331f5c425d3dbc7269d99ea7265"
    end

    on_arm do
      url "https://github.com/vee-sh/veessh/releases/download/v#{version}/veessh_v#{version}_darwin_arm64.tar.gz"
      sha256 "c2f6c1fa1e51f3befd23dfa8603e7edd55e5abb871c1c96a366fb087360ba1d1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/veessh/releases/download/v#{version}/veessh_v#{version}_linux_amd64.tar.gz"
      sha256 "4a509b6796098339a7a10f4cc64c9dbae3cf74d0dd29ece19951f371ce1478fb"
    end

    on_arm do
      url "https://github.com/vee-sh/veessh/releases/download/v#{version}/veessh_v#{version}_linux_arm64.tar.gz"
      sha256 "29dce80e81c170d834816c86aaa20795058e54f2c51a728aa83e8f3c5fe9d9bd"
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
