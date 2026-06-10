class Augur < Formula
  desc "Graded trust for code changes: risk scoring (proceed/review/block) for humans and agents"
  homepage "https://github.com/CorvidLabs/augur"
  license "MIT"
  version "0.2.1"

  on_macos do
    url "https://github.com/CorvidLabs/augur/releases/download/v0.2.1/augur-macos-universal"
    sha256 "60cc7f70225dd5c4c3d6ac0dec0c4175725049d6706a111dbd45a14996c2c5b4"

    def install
      bin.install "augur-macos-universal" => "augur"
    end
  end

  test do
    assert_match "0.2.1", shell_output("#{bin}/augur --version")
  end
end
