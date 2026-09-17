class Hi < Formula
  desc "Acceptance criteria in human words, with permanent ids"
  homepage "https://corvidlabs.xyz/hi"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/hi/releases/download/v#{version}/hi-aarch64-apple-darwin.tar.gz"
      sha256 "ea82223abbb582fdcb704b069f27535777f5906724a98a2f491fba0927fbe3b5"
    end

    on_intel do
      url "https://github.com/CorvidLabs/hi/releases/download/v#{version}/hi-x86_64-apple-darwin.tar.gz"
      sha256 "7e3f89141bab6e432c14165fc17466234ece62d38e4e6acdbd4d7a091cac4fa5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CorvidLabs/hi/releases/download/v#{version}/hi-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4a27a009c21a3df2e2a6112d4e4cf901130eb824a021da61ffb20bf4155fc478"
    end

    on_intel do
      url "https://github.com/CorvidLabs/hi/releases/download/v#{version}/hi-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "035df77864aae980b1497a4ca18d389acb27a8f026692a8adf96b006b9527788"
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
