class Hi < Formula
  desc "Acceptance criteria in human words, with permanent ids"
  homepage "https://corvidlabs.xyz/hi"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/hi/releases/download/v#{version}/hi-aarch64-apple-darwin.tar.gz"
      sha256 "916ce5d08961297aada424c5176026e61922af93a7a2d92faf57624e4365586d"
    end

    on_intel do
      url "https://github.com/CorvidLabs/hi/releases/download/v#{version}/hi-x86_64-apple-darwin.tar.gz"
      sha256 "c1ebdd047afe43ce0cba4f582daac1e30027f679707c2d8515fc6a57d0b3ecff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CorvidLabs/hi/releases/download/v#{version}/hi-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7db8de5c983976bc73e4e7df298761d1b9a932583c2199e38932fe59b3b9c58c"
    end

    on_intel do
      url "https://github.com/CorvidLabs/hi/releases/download/v#{version}/hi-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ba6c0ec620650ed255a1fd17ee854410089cc27a0f98f738ea14c61baa0142f8"
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
