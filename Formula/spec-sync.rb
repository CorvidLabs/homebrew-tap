class SpecSync < Formula
  desc "Bidirectional spec-to-code validation for CI-enforced contracts"
  homepage "https://corvidlabs.xyz/spec-sync"
  version "5.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-macos-aarch64.tar.gz"
      sha256 "5ebadc47c1b6b6d409af1b09d88d1ebc945cb11a32789f9e7b4785acfcc5246c"
    end

    on_intel do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-macos-x86_64.tar.gz"
      sha256 "994ab5aacc1045e704bb198c1495d737149e67e8ae11af22608d8357aaaba05d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-linux-x86_64.tar.gz"
      sha256 "05e111dbcc042a2d2d1609e767ffdce2b5feb1a37f32e7b625567fcb176462e9"
    end
  end

  def install
    binary = if OS.mac?
      Hardware::CPU.arm? ? "specsync-macos-aarch64" : "specsync-macos-x86_64"
    else
      "specsync-linux-x86_64"
    end
    bin.install binary => "specsync"
  end

  test do
    assert_match "5.0.1", shell_output("#{bin}/specsync --version")
  end
end
