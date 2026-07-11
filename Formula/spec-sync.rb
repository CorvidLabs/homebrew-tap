class SpecSync < Formula
  desc "Bidirectional spec-to-code validation for CI-enforced contracts"
  homepage "https://corvidlabs.xyz/spec-sync"
  version "5.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-macos-aarch64.tar.gz"
      sha256 "a92151f09ce35a209f35bd4a76420e8cd722630c56edcc51fc0463ae5657f5ff"
    end

    on_intel do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-macos-x86_64.tar.gz"
      sha256 "6005134ce9280177b13f57157862c9ec2114bfdf5d8d2f3c927da5ed6342c60b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-linux-aarch64.tar.gz"
      sha256 "9b785202b1661c130b641856a1ef09e41383e59cf1884f909dfab101b8cb9a58"
    end

    on_intel do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-linux-x86_64.tar.gz"
      sha256 "2f1659d54024ff5546e6fda2b64c5a14145c546e8c4f3a9419eeb85ac19dcd77"
    end
  end

  def install
    binary = if OS.mac?
      Hardware::CPU.arm? ? "specsync-macos-aarch64" : "specsync-macos-x86_64"
    else
      Hardware::CPU.arm? ? "specsync-linux-aarch64" : "specsync-linux-x86_64"
    end
    bin.install binary => "specsync"
  end

  test do
    assert_match "5.0.0", shell_output("#{bin}/specsync --version")
  end
end
