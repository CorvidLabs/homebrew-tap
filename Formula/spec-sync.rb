class SpecSync < Formula
  desc "Bidirectional spec-to-code validation for CI-enforced contracts"
  homepage "https://corvidlabs.xyz/spec-sync"
  version "4.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-macos-aarch64.tar.gz"
      sha256 "40eb10ba222e119dc38efd0ed5871a03adfa43f779a03e706e4857c7d227a560"

      define_method(:install) do
        bin.install "specsync-macos-aarch64" => "specsync"
      end
    end

    on_intel do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-macos-x86_64.tar.gz"
      sha256 "528c7fbd9a31396eb68aab5ef267806282ac70cb13441e37eb1588fcb8e479e9"

      define_method(:install) do
        bin.install "specsync-macos-x86_64" => "specsync"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/CorvidLabs/spec-sync/releases/download/v#{version}/specsync-linux-x86_64.tar.gz"
      sha256 "2c4d8a74cbc1d20d2b67d7e11a453f75fbe0095b24c7a44bb996d0e5a4ac1ff1"

      define_method(:install) do
        bin.install "specsync-linux-x86_64" => "specsync"
      end
    end
  end

  test do
    assert_match "4.7.1", shell_output("#{bin}/specsync --version")
  end
end
