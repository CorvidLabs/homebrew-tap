class Augur < Formula
  desc "Graded trust for code changes: risk scoring (proceed/review/block) for humans and agents"
  homepage "https://github.com/CorvidLabs/augur"
  license "MIT"
  version "0.3.0"

  on_macos do
    url "https://github.com/CorvidLabs/augur/releases/download/v0.3.0/augur-macos-universal"
    sha256 "78124d36e1e100dbcff0ecd45d49d6ebcf1f6818630b96ae0f57a29ee4d3ba62"

    def install
      bin.install "augur-macos-universal" => "augur"
    end
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/augur --version")
  end
end
