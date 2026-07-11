class Fledge < Formula
  desc "Dev lifecycle CLI - one tool for the dev loop, any language"
  homepage "https://github.com/CorvidLabs/fledge"
  # NOTE: This file is updated POST-release by .github/workflows/post-release-formula.yml
  # in the fledge repo. Don't bump manually — shas don't exist at bump time.
  version "1.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/fledge/releases/download/v#{version}/fledge-macos-aarch64"
      sha256 "21d0916d52ef14e6d33e3967417773369e047a0311e66bbb1eecc8f69332a040"
    end

    on_intel do
      url "https://github.com/CorvidLabs/fledge/releases/download/v#{version}/fledge-macos-x86_64"
      sha256 "9b93babd60f87dc67c1df1902b35ab71c06912a267821c05688e6cd842c71072"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/CorvidLabs/fledge/releases/download/v#{version}/fledge-linux-x86_64"
      sha256 "9a2c5a0db698811052ad741dd8da5a3e8af5e46797f11b6cc59dffbd49917170"
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
    assert_match "1.7.0", shell_output("#{bin}/fledge --version")
  end
end
