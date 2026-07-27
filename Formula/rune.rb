class Rune < Formula
  desc "Universal TTY ↔ AI Agent bridge and Ruby CLI framework"
  homepage "https://github.com/CorvidLabs/rune"
  url "https://github.com/CorvidLabs/rune/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "b2db3c7aac418427ca527668fc53aed8546eadbc3522b81ee76e2769acd26fd5"
  license "MIT"
  head "https://github.com/CorvidLabs/rune.git", branch: "main"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "rune.gemspec"
    system "gem", "install", "rune-#{version}.gem"
    bin.install libexec/"bin/rune"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: libexec)
  end

  test do
    output = shell_output("#{bin}/rune version --json")
    assert_match '"status":"ok"', output
    assert_match '"name":"rune"', output
  end
end
