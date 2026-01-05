# typed: false
# frozen_string_literal: true

class Veessh < Formula
  desc "Console connection manager for SSH/SFTP/Telnet/Mosh/SSM/GCloud"
  homepage "https://github.com/vee-sh/veessh"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/vee-sh/veessh/releases/download/v#{version}/veessh_v#{version}_darwin_amd64.tar.gz"
      sha256 "03cc06680cfd8f1bb3d62f4e1517b41d7189025478bafc7a130966bd2988ca52"
    end

    on_arm do
      url "https://github.com/vee-sh/veessh/releases/download/v#{version}/veessh_v#{version}_darwin_arm64.tar.gz"
      sha256 "253a693878891618cbcd74c0b40955fe37d23d55784506a2fad23723d9a11334"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vee-sh/veessh/releases/download/v#{version}/veessh_v#{version}_linux_amd64.tar.gz"
      sha256 "aeed8286d6985272a63edf8381a6afda47ad88cd5e862367a0ec8ab07a8f576d"
    end

    on_arm do
      url "https://github.com/vee-sh/veessh/releases/download/v#{version}/veessh_v#{version}_linux_arm64.tar.gz"
      sha256 "b82c859fb48b7e43035dd082eb1cec49a42d004c14fcf10b58adf4f4b479a083"
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
