class Rune < Formula
  desc "Universal TTY ↔ AI Agent bridge and Ruby CLI framework"
  homepage "https://github.com/CorvidLabs/rune"
  url "https://github.com/CorvidLabs/rune/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "30144098b5ff2600444ffc205c1bafdb72c70612c9743c7f2b679411796323d0"
  license "MIT"
  head "https://github.com/CorvidLabs/rune.git", branch: "main"

  depends_on "ruby"

  def install
    gem = formula_opt_bin("ruby")/"gem"

    system gem, "build", "rune.gemspec"
    system gem, "install", "rune-#{version}.gem",
           "--ignore-dependencies", "--no-document", "--install-dir", libexec
    bin.env_script_all_files(libexec/"bin", GEM_HOME: libexec)
  end

  test do
    output = shell_output("#{bin}/rune version --json")
    assert_match '"status":"ok"', output
    assert_match '"name":"rune"', output
    assert_match %Q("version":"#{version}"), output

    run_output = shell_output("#{bin}/rune run --json -- printf homebrew")
    assert_match '"clean_output":"homebrew"', run_output
  end
end
