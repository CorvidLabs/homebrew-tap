class Fledge < Formula
  desc "Dev lifecycle CLI - one tool for the dev loop, any language"
  homepage "https://github.com/CorvidLabs/fledge"
  # NOTE: This file is updated POST-release by .github/workflows/post-release-formula.yml
  # in the fledge repo. Don't bump manually — shas don't exist at bump time.
  version "1.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/fledge/releases/download/v#{version}/fledge-macos-aarch64"
      sha256 "7863d648e8eef0ffd67c8b6edef2699687c91633956aa62b22a8f66a44cf76fd"
    end

    on_intel do
      url "https://github.com/CorvidLabs/fledge/releases/download/v#{version}/fledge-macos-x86_64"
      sha256 "5866aad08beccf7d8323cbdcff5b4ecd31343397dd3d5e1d4a5c7309c797119f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/CorvidLabs/fledge/releases/download/v#{version}/fledge-linux-x86_64"
      sha256 "bbdf241683fde6960e75eb41830d928bf3251a706e047e5f9e951bd40bdfc764"
    end
  end

  def install
    binary = if OS.mac?
      Hardware::CPU.arm? ? "fledge-macos-aarch64" : "fledge-macos-x86_64"
    else
      "fledge-linux-x86_64"
    end
    bin.install binary => "fledge"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fledge --version")
  end
end
