class Augur < Formula
  desc "Graded trust for code changes with deterministic risk scoring"
  homepage "https://github.com/CorvidLabs/augur"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/augur/releases/download/v#{version}/augur-macos-universal"
      sha256 "61b91414591a84975a05515f89b4cdf413e2364781f0a46c2c7024e6d5e6a0e2"

      define_method(:install) do
        bin.install "augur-macos-universal" => "augur"
      end
    end

    on_intel do
      url "https://github.com/CorvidLabs/augur/releases/download/v#{version}/augur-macos-universal"
      sha256 "61b91414591a84975a05515f89b4cdf413e2364781f0a46c2c7024e6d5e6a0e2"

      define_method(:install) do
        bin.install "augur-macos-universal" => "augur"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/CorvidLabs/augur/releases/download/v#{version}/augur-linux-x86_64"
      sha256 "fcba3127eccaa22b65d8a075831773cf8f5f10d170d7ee59d497d0002c2fa0ee"

      define_method(:install) do
        bin.install "augur-linux-x86_64" => "augur"
      end
    end
  end

  test do
    assert_match "0.4.1", shell_output("#{bin}/augur --version")
  end
end
