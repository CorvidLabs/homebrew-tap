class Hi < Formula
  desc "Acceptance criteria in human words, with permanent ids"
  homepage "https://corvidlabs.xyz/hi"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/hi/releases/download/v#{version}/hi-aarch64-apple-darwin.tar.gz"
      sha256 "6dd77ab3e52cac3f02be73940858b5a721d77901ef8383b8e12b712a98142e95"
    end

    on_intel do
      url "https://github.com/CorvidLabs/hi/releases/download/v#{version}/hi-x86_64-apple-darwin.tar.gz"
      sha256 "feba5ca83919b1dcc35a1982a624a0d91f3773110a236e4c40cbeb93e95f0502"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CorvidLabs/hi/releases/download/v#{version}/hi-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cd3e574839f49b1e1f10b3d0644e417634c8a4cf570e25c3caa98faacbbdc5c8"
    end

    on_intel do
      url "https://github.com/CorvidLabs/hi/releases/download/v#{version}/hi-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "292f9acde69cb9de272fdeb355309a3ce6de1a60d603026e1af4ffb5d2df982e"
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
