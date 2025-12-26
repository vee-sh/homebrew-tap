# typed: false
# frozen_string_literal: true

class Veessh < Formula
  desc "Console connection manager for SSH/SFTP/Telnet/Mosh/SSM/GCloud"
  homepage "https://github.com/vee-sh/veessh"
  version "0.5.1"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/vee-sh/veessh/releases/download/v#{version}/veessh_v#{version}_darwin_amd64.tar.gz"
      sha256 "6975e31b8cbb78fed81be3831925d97807fd5bec5c2acb31b95a8ab819e7b76d"
    end

    on_arm do
      url "https://github.com/vee-sh/veessh/releases/download/v#{version}/veessh_v#{version}_darwin_arm64.tar.gz"
      sha256 "159a9cfb3f7b6a3d87cad4535859ca1026fc17a7b8cfc3f2e623e51989ab2277"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/veessh/releases/download/v#{version}/veessh_v#{version}_linux_amd64.tar.gz"
      sha256 "5d376e9bec06b7693451da4f2f07e1b9a7bf3c5e4b9903c149e546370cbae3eb"
    end

    on_arm do
      url "https://github.com/vee-sh/veessh/releases/download/v#{version}/veessh_v#{version}_linux_arm64.tar.gz"
      sha256 "ba1b13d689db43b5f4a12e631f056a57505aafd9a56cfd69223bbee9338b52bb"
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
