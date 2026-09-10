class SpecSync < Formula
  desc "Bidirectional spec-to-code validation for CI-enforced contracts"
  homepage "https://corvidlabs.xyz/spec-sync"
  version "6.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-macos-aarch64.tar.gz"
      sha256 "1328beeeba827a380840d51525e7aef1c67fee0ee53263db156948b3a29f7c42"
    end

    on_intel do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-macos-x86_64.tar.gz"
      sha256 "c81e816e3e25b8c5a9b997e15b9049e0c6809aa8be42429a680d5dbbc1ac7820"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-linux-aarch64.tar.gz"
      sha256 "fe5ccadf37c0448596fa83b3d819c8575e06ef187bfc88888cfb410bacad7201"
    end

    on_intel do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-linux-x86_64.tar.gz"
      sha256 "17ce857e9c48e3a23fa6767d0bbad7b7425c0095e0f5953cac67bf0f4f25aaec"
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
