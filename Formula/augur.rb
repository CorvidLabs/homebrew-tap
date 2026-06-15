class Augur < Formula
  desc "Graded trust for code changes with deterministic risk scoring"
  homepage "https://github.com/CorvidLabs/augur"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/augur/releases/download/v#{version}/augur-macos-universal"
      sha256 "59d0a091a7bd563ea2b085a50f5690c99e4ac9fc7c8f360d6711101d2ff74563"

      define_method(:install) do
        bin.install "augur-macos-universal" => "augur"
      end
    end

    on_intel do
      url "https://github.com/CorvidLabs/augur/releases/download/v#{version}/augur-macos-universal"
      sha256 "59d0a091a7bd563ea2b085a50f5690c99e4ac9fc7c8f360d6711101d2ff74563"

      define_method(:install) do
        bin.install "augur-macos-universal" => "augur"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/CorvidLabs/augur/releases/download/v#{version}/augur-linux-x86_64"
      sha256 "30c01374ab4ab2a740f26576cc4f137d50952fc2bd177adc02f5cc134b1ce99a"

      define_method(:install) do
        bin.install "augur-linux-x86_64" => "augur"
      end
    end
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/augur --version")
  end
end
