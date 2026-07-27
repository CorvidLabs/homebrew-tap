class Fledge < Formula
  desc "Dev lifecycle CLI - one tool for the dev loop, any language"
  homepage "https://github.com/CorvidLabs/fledge"
  # NOTE: This file is updated POST-release by .github/workflows/post-release-formula.yml
  # in the fledge repo. Don't bump manually — shas don't exist at bump time.
  version "1.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/fledge/releases/download/v#{version}/fledge-macos-aarch64"
      sha256 "073fd399fc19e7604b8498e78bebbc00ea22bc346daad0394d7d278ad60c8a02"
    end

    on_intel do
      url "https://github.com/CorvidLabs/fledge/releases/download/v#{version}/fledge-macos-x86_64"
      sha256 "5c52a05710918d8bf566546fdaa8f32792b169bbefad46addb6009837f7819d2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/CorvidLabs/fledge/releases/download/v#{version}/fledge-linux-x86_64"
      sha256 "bebbd9b9f377468b377ee1e177aef96992ee8f8d9f075f9fe2323153f2e165ec"
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
    assert_match "1.7.0", shell_output("#{bin}/fledge --version")
  end
end
