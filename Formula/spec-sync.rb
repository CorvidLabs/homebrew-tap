class SpecSync < Formula
  desc "Bidirectional spec-to-code validation for CI-enforced contracts"
  homepage "https://corvidlabs.xyz/spec-sync"
  version "5.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-macos-aarch64.tar.gz"
      sha256 "aebc78a7aa1296b304a977a8e21f7da591c8c164fe9d0b21197150f3fdc54947"
    end

    on_intel do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-macos-x86_64.tar.gz"
      sha256 "506fba8f2952ea7edbfc6b0787ece974e7979fcdfc97e7ac85b49ae3f90615f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-linux-aarch64.tar.gz"
      sha256 "e7adda62fb10bfe9a9988f29a0fdd9223d2d4c018571f16b16babdeef3504dc9"
    end

    on_intel do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-linux-x86_64.tar.gz"
      sha256 "9db7347c8ea15eb6a60dd84181c40539beea5395c64eb13dd4c87b77b3a81c3b"
    end
  end

  def install
    os = OS.mac? ? "macos" : "linux"
    arch = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    bin.install "specsync-#{os}-#{arch}" => "specsync"
  end

  test do
    assert_match "5.1.1", shell_output("#{bin}/specsync --version")
  end
end
