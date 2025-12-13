# typed: false
# frozen_string_literal: true

class Veessh < Formula
  desc "Console connection manager for SSH/SFTP/Telnet/Mosh/SSM/GCloud"
  homepage "https://github.com/vee-sh/veessh"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/vee-sh/veessh/releases/download/v#{version}/veessh_v#{version}_darwin_amd64.tar.gz"
      sha256 "PLACEHOLDER_WILL_BE_UPDATED_BY_RELEASE_WORKFLOW"
    end

    on_arm do
      url "https://github.com/vee-sh/veessh/releases/download/v#{version}/veessh_v#{version}_darwin_arm64.tar.gz"
      sha256 "PLACEHOLDER_WILL_BE_UPDATED_BY_RELEASE_WORKFLOW"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/veessh/releases/download/v#{version}/veessh_v#{version}_linux_amd64.tar.gz"
      sha256 "PLACEHOLDER_WILL_BE_UPDATED_BY_RELEASE_WORKFLOW"
    end

    on_arm do
      url "https://github.com/vee-sh/veessh/releases/download/v#{version}/veessh_v#{version}_linux_arm64.tar.gz"
      sha256 "PLACEHOLDER_WILL_BE_UPDATED_BY_RELEASE_WORKFLOW"
    end
  end

  def install
    bin.install "veessh"
    generate_completions_from_executable(bin/"veessh", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/veessh --version")
  end
end
