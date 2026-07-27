class Fledge < Formula
  desc "Dev lifecycle CLI - one tool for the dev loop, any language"
  homepage "https://github.com/CorvidLabs/fledge"
  # NOTE: This file is updated POST-release by .github/workflows/post-release-formula.yml
  # in the fledge repo. Don't bump manually — shas don't exist at bump time.
  version "1.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/fledge/releases/download/v#{version}/fledge-macos-aarch64"
      sha256 "185323ca7c2ba883283f5e1c2300876adb6ad6f48925d8043fec6874e26edf63"
    end

    on_intel do
      url "https://github.com/CorvidLabs/fledge/releases/download/v#{version}/fledge-macos-x86_64"
      sha256 "4ea084251bba2a3bd73938f5a28bbb955d14aba0ab8091864100f905f1c06de8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/CorvidLabs/fledge/releases/download/v#{version}/fledge-linux-x86_64"
      sha256 "636f07db603bb97c38c6259b633e6afd3335de7f25dd558ead5f3b30ea198e7d"
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
