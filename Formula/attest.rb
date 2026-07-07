class Attest < Formula
  desc "Signed provenance for code changes, a verifiable ledger keyed to commit SHAs"
  homepage "https://github.com/CorvidLabs/attest"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/attest/releases/download/#{version}/attest-macos-universal"
      sha256 "43e94fba3481bc27ad6df14241e7e6eb3918aa95f33a96f3a21f1f821a04e673"

      define_method(:install) do
        bin.install "attest-macos-universal" => "attest"
      end
    end

    on_intel do
      url "https://github.com/CorvidLabs/attest/releases/download/#{version}/attest-macos-universal"
      sha256 "43e94fba3481bc27ad6df14241e7e6eb3918aa95f33a96f3a21f1f821a04e673"

      define_method(:install) do
        bin.install "attest-macos-universal" => "attest"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/CorvidLabs/attest/releases/download/#{version}/attest-linux-x86_64"
      sha256 "b4cf526292c24efbe3308e2b90aa2ca6120a3179186ede5ffabf965c4d3db022"

      define_method(:install) do
        bin.install "attest-linux-x86_64" => "attest"
      end
    end
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/attest --version")
  end
end
