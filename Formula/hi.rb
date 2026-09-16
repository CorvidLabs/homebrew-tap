class Hi < Formula
  desc "Acceptance criteria in human words, with permanent ids"
  homepage "https://corvidlabs.xyz/hi"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/hi/releases/download/v#{version}/hi-aarch64-apple-darwin.tar.gz"
      sha256 "246be94af64fcb9fcd78c6010c7bf1bdb70aa8f3ad0713b4b977c1025e7236d5"
    end

    on_intel do
      url "https://github.com/CorvidLabs/hi/releases/download/v#{version}/hi-x86_64-apple-darwin.tar.gz"
      sha256 "5472d87d0cc06ab0c9aeb3e8b69f2fc6c55527cce1cb347dee4279939cac2fea"
    end
  end

  on_linux do
    # Linux arm64 is deliberately absent: hi's release workflow does not build
    # aarch64-unknown-linux-gnu yet, so there is no asset to check a sha against.
    on_intel do
      url "https://github.com/CorvidLabs/hi/releases/download/v#{version}/hi-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ed311f20eb4bca4e38c002b27fd24fdabf3c47cb788a2b73153b93339025bd5d"
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
