class Threemd < Formula
  desc "CLI for the 3md format: Markdown extended along one free Z axis"
  homepage "https://github.com/CorvidLabs/3md"
  url "https://github.com/CorvidLabs/3md/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "ce8f82e44ea46add90357981612e5df4c2966a01aff59b8ac0903fa8a0260cad"
  license "MIT"
  head "https://github.com/CorvidLabs/3md.git", branch: "main"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release", "--product", "threemd"
    bin.install ".build/release/threemd"
  end

  test do
    (testpath/"sample.3md").write <<~EOS
      ---
      3md: 1.0
      axis: time
      title: Sample
      ---
      @plane z=0 label="One"
      # One

      @plane z=1 label="Two"
      # Two
    EOS
    assert_match "ok", shell_output("#{bin}/threemd validate #{testpath}/sample.3md")
    info = shell_output("#{bin}/threemd info #{testpath}/sample.3md")
    assert_match "axis:", info
    assert_match "time", info
  end
end
