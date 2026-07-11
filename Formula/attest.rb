class Attest < Formula
  desc "Signed provenance ledger for code changes"
  homepage "https://corvidlabs.xyz/attest"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/attest/releases/download/#{version}/attest-macos-universal"
      sha256 "65d419cc26e3fbce1256d70aeb267d8307289532b89bfe3575e3031d3f0513c7"
    end

    on_intel do
      url "https://github.com/CorvidLabs/attest/releases/download/#{version}/attest-macos-universal"
      sha256 "65d419cc26e3fbce1256d70aeb267d8307289532b89bfe3575e3031d3f0513c7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/CorvidLabs/attest/releases/download/#{version}/attest-linux-x86_64"
      sha256 "38b1193be424bf654d5b7b92593998745a1387c419e34e78a30805a6c067ec38"
    end
  end

  def install
    binary = OS.mac? ? "attest-macos-universal" : "attest-linux-x86_64"
    bin.install binary => "attest"
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/attest --version")
  end
end
