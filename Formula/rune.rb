class Rune < Formula
  desc "Universal TTY ↔ AI Agent bridge and Ruby CLI framework"
  homepage "https://github.com/CorvidLabs/rune"
  url "https://github.com/CorvidLabs/rune/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "070b3df607a494125e8ec402d179c9f53736ef8452dd37044038a6c998192da9"
  license "MIT"
  head "https://github.com/CorvidLabs/rune.git", branch: "main"

  depends_on "ruby"

  def install
    gem = formula_opt_bin("ruby")/"gem"

    system gem, "build", "rune.gemspec"
    system gem, "install", "rune-#{version}.gem",
           "--ignore-dependencies", "--no-document", "--install-dir", libexec
    (bin/"rune").write_env_script libexec/"bin/rune", GEM_HOME: libexec
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
