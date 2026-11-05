class SpecSync < Formula
  desc "Bidirectional spec-to-code validation for CI-enforced contracts"
  homepage "https://corvidlabs.xyz/spec-sync"
  version "6.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-macos-aarch64.tar.gz"
      sha256 "beb39b0e6f503abc1e18fa1527c5a3db199e21bd7cc17283714db7e3227acca9"
    end

    on_intel do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-macos-x86_64.tar.gz"
      sha256 "96d77c063db5b7fb0b0cca0cd3825fae6e067044eb9268b8e532c940b0f4e72a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-linux-aarch64.tar.gz"
      sha256 "86e081a5ef8084f1282d77d807e495b1dbdbc8ae89840594ed3e915439bcf35a"
    end

    on_intel do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-linux-x86_64.tar.gz"
      sha256 "be0c83a9676f7ae1116e5bd744e69a7b1cb8eabed767c1cbc455d7185c8e4c39"
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
