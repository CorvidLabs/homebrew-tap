class Rune < Formula
  desc "Universal TTY ↔ AI Agent bridge and Ruby CLI framework"
  homepage "https://github.com/CorvidLabs/rune"
  url "https://github.com/CorvidLabs/rune/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5b4ab909291d5cfac13a1caff57ef3f8255f99119f31066ee74484ed2940a6c5"
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
