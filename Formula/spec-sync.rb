class SpecSync < Formula
  desc "Bidirectional spec-to-code validation for CI-enforced contracts"
  homepage "https://corvidlabs.xyz/spec-sync"
  version "6.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-macos-aarch64.tar.gz"
      sha256 "9c9611ee1e4d34471ad6bf86e7db3d7c094bb996b4bbe2276b72b3b35e31b053"
    end

    on_intel do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-macos-x86_64.tar.gz"
      sha256 "d3c67f858f5b2cab86413e65adf47cf488200c8ad311e33ee36e1355b6746248"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-linux-aarch64.tar.gz"
      sha256 "bf0f7e63410c9fad2f496a0b82253300a6ad327fe39920821a5144a91999b69a"
    end

    on_intel do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-linux-x86_64.tar.gz"
      sha256 "1e8c88530a24d40215fa211374247449cffbd99a9d41a652a995649cf4806446"
    end
  end

  def install
    os = OS.mac? ? "macos" : "linux"
    arch = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    bin.install "specsync-#{os}-#{arch}" => "specsync"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specsync --version")
  end
end
