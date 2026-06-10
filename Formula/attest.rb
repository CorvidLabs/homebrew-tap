class Attest < Formula
  desc "Signed provenance for code changes, a verifiable ledger keyed to commit SHAs"
  homepage "https://github.com/CorvidLabs/attest"
  license "MIT"
  version "0.2.0"

  on_macos do
    url "https://github.com/CorvidLabs/attest/releases/download/v0.2.0/attest-macos-universal"
    sha256 "340409d992e2dac20f15c99c6652bc849bf0a7a62bd3d8c552c04637e00e6e8e"

    def install
      bin.install "attest-macos-universal" => "attest"
    end
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/attest --version")
  end
end
