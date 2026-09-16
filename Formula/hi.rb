class Hi < Formula
  desc "Acceptance criteria in human words, with permanent ids"
  homepage "https://corvidlabs.xyz/hi"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/hi/releases/download/v#{version}/hi-aarch64-apple-darwin.tar.gz"
      sha256 "d740896c0af94a295b9a2652cc11f7bc862eec899993f041bd5cfbf03ea43964"
    end

    on_intel do
      url "https://github.com/CorvidLabs/hi/releases/download/v#{version}/hi-x86_64-apple-darwin.tar.gz"
      sha256 "a855eb91f16e2ff89f1c5b306dcf0e2ae82c97f05f7d9928700c7b8309b95ac8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CorvidLabs/hi/releases/download/v#{version}/hi-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "949d2896f954da9f011c9b75ec3b45df3d5a6c577de33533622c23e7a2dbf2a1"
    end

    on_intel do
      url "https://github.com/CorvidLabs/hi/releases/download/v#{version}/hi-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c0d7f5f52aaf136094e1f202cb63577907900647acb6e05a60f010d5884be856"
    end
  end

  def install
    bin.install "hi"
    doc.install "README.md", "THIRD-PARTY-LICENSES.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hi --version")

    # hi anchors to a repository, so give it one before asking it to write.
    system "git", "init"
    system bin/"hi", "SEND-1", "I hit enter and the message shows up right away."
    assert_match "**SEND-1**", (testpath/"hi/send.md").read

    assert_match "1 criterion · 1 family · 1 file", shell_output("#{bin}/hi check")
    assert_match "I hit enter", shell_output("#{bin}/hi ls")

    # The page is one self-contained file that fetches nothing.
    system bin/"hi", "view"
    page = (testpath/"intent.html").read
    assert_match "SEND-1", page
    refute_match "https://", page
  end
end
