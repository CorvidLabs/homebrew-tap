class SpecSync < Formula
  desc "Bidirectional spec-to-code validation for CI-enforced contracts"
  homepage "https://corvidlabs.xyz/spec-sync"
  version "6.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-macos-aarch64.tar.gz"
      sha256 "87e5a4ed3051af81bc25bdad519f276275f4a6db24abd80a2cd4d18e2f6a2bb0"
    end

    on_intel do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-macos-x86_64.tar.gz"
      sha256 "3b3eaf556b7555ce212788dfe6d3c77791288a4e307b6986c63729c9a98fa4a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-linux-aarch64.tar.gz"
      sha256 "85534a1d9ef6febaccafd46fa88ad8897c8cecc181b4bccb2555d313b49608c8"
    end

    on_intel do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-linux-x86_64.tar.gz"
      sha256 "f5224f6090284c6352781f841647af5b0603af8c9d649525cb6dc328380ce973"
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
