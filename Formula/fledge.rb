class Fledge < Formula
  desc "Dev lifecycle CLI - one tool for the dev loop, any language"
  homepage "https://github.com/CorvidLabs/fledge"
  # NOTE: This file is updated POST-release by .github/workflows/post-release-formula.yml
  # in the fledge repo. Don't bump manually — shas don't exist at bump time.
  version "1.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/fledge/releases/download/v#{version}/fledge-macos-aarch64"
      sha256 "e4ae8a24c3b3a217f9080e48cae2fa9e91c9774bca5cae83e86d39f402282d62"
    end

    on_intel do
      url "https://github.com/CorvidLabs/fledge/releases/download/v#{version}/fledge-macos-x86_64"
      sha256 "2122c01c452e6ef5ab559541602bcfb6c600de951d051b6af97a553697accca8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/CorvidLabs/fledge/releases/download/v#{version}/fledge-linux-x86_64"
      sha256 "5af676a8a5530e545bdb820e770f682e86d0fb0d7f88abdb10634caa73937969"
    end
  end

  def install
    binary = if OS.mac?
      Hardware::CPU.arm? ? "fledge-macos-aarch64" : "fledge-macos-x86_64"
    else
      "fledge-linux-x86_64"
    end
    bin.install binary => "fledge"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fledge --version")
  end
end
