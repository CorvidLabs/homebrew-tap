class Augur < Formula
  desc "Graded trust for code changes with deterministic risk scoring"
  homepage "https://github.com/CorvidLabs/augur"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/augur/releases/download/#{version}/augur-macos-universal"
      sha256 "9398827d87fbaa02ac986957438676140eba746255e742b6215073c7134e1cbe"

      define_method(:install) do
        bin.install "augur-macos-universal" => "augur"
      end
    end

    on_intel do
      url "https://github.com/CorvidLabs/augur/releases/download/#{version}/augur-macos-universal"
      sha256 "9398827d87fbaa02ac986957438676140eba746255e742b6215073c7134e1cbe"

      define_method(:install) do
        bin.install "augur-macos-universal" => "augur"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/CorvidLabs/augur/releases/download/#{version}/augur-linux-x86_64"
      sha256 "b408f5f690187072e6ffd98d3bb26050847c37e065f7ca3bfa22492d4193f4bd"

      define_method(:install) do
        bin.install "augur-linux-x86_64" => "augur"
      end
    end
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/augur --version")
  end
end
