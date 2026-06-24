class Attest < Formula
  desc "Signed provenance for code changes, a verifiable ledger keyed to commit SHAs"
  homepage "https://github.com/CorvidLabs/attest"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/attest/releases/download/v#{version}/attest-macos-universal"
      sha256 "43e94fba3481bc27ad6df14241e7e6eb3918aa95f33a96f3a21f1f821a04e673"

      define_method(:install) do
        bin.install "attest-macos-universal" => "attest"
      end
    end

    on_intel do
      url "https://github.com/CorvidLabs/attest/releases/download/v#{version}/attest-macos-universal"
      sha256 "43e94fba3481bc27ad6df14241e7e6eb3918aa95f33a96f3a21f1f821a04e673"

      define_method(:install) do
        bin.install "attest-macos-universal" => "attest"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/CorvidLabs/attest/releases/download/v#{version}/attest-linux-x86_64"
      sha256 "90a131005ef955ea91f37cbefbeec66fd89748bed1f0f2d8ac0b8be71e2795fa"

      define_method(:install) do
        bin.install "attest-linux-x86_64" => "attest"
      end
    end
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/attest --version")
  end
end
