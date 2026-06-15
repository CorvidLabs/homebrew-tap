class Attest < Formula
  desc "Signed provenance for code changes, a verifiable ledger keyed to commit SHAs"
  homepage "https://github.com/CorvidLabs/attest"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/attest/releases/download/v#{version}/attest-macos-universal"
      sha256 "8a0659636ea416e8944e01cbc9940dda67e7a840bf3b03e837c5cf91d5bbf196"

      define_method(:install) do
        bin.install "attest-macos-universal" => "attest"
      end
    end

    on_intel do
      url "https://github.com/CorvidLabs/attest/releases/download/v#{version}/attest-macos-universal"
      sha256 "8a0659636ea416e8944e01cbc9940dda67e7a840bf3b03e837c5cf91d5bbf196"

      define_method(:install) do
        bin.install "attest-macos-universal" => "attest"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/CorvidLabs/attest/releases/download/v#{version}/attest-linux-x86_64"
      sha256 "88089187a28b86ebd2a25d9aef620842b18d41de28be9050327a62094e03c47b"

      define_method(:install) do
        bin.install "attest-linux-x86_64" => "attest"
      end
    end
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/attest --version")
  end
end
