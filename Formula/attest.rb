class Attest < Formula
  desc "Signed provenance for code changes, a verifiable ledger keyed to commit SHAs"
  homepage "https://github.com/CorvidLabs/attest"
  license "MIT"
  version "0.3.0"

  on_macos do
    url "https://github.com/CorvidLabs/attest/releases/download/v0.3.0/attest-macos-universal"
    sha256 "ee52c4751afb96899213f6a5cf6a4fd741403e9d419829cf01d4b67e618a0a63"

    def install
      bin.install "attest-macos-universal" => "attest"
    end
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/attest --version")
  end
end
