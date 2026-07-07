class Augur < Formula
  desc "Graded trust for code changes with deterministic risk scoring"
  homepage "https://github.com/CorvidLabs/augur"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/augur/releases/download/#{version}/augur-macos-universal"
      sha256 "c260e6b22fc5991e145e189798378f2a215235ccbc23ff168c908bfa349701fe"

      define_method(:install) do
        bin.install "augur-macos-universal" => "augur"
      end
    end

    on_intel do
      url "https://github.com/CorvidLabs/augur/releases/download/#{version}/augur-macos-universal"
      sha256 "c260e6b22fc5991e145e189798378f2a215235ccbc23ff168c908bfa349701fe"

      define_method(:install) do
        bin.install "augur-macos-universal" => "augur"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/CorvidLabs/augur/releases/download/#{version}/augur-linux-x86_64"
      sha256 "1c72cbb231ed549fde745794696e222e3cc624562f8e954c17f9894e731cd718"

      define_method(:install) do
        bin.install "augur-linux-x86_64" => "augur"
      end
    end
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/augur --version")
  end
end
