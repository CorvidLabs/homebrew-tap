class CorvidTrust < Formula
  desc "Unified lifecycle, contract, risk, and provenance gate"
  homepage "https://github.com/CorvidLabs/trust"
  url "https://github.com/CorvidLabs/trust/archive/refs/tags/v1.1.2.tar.gz"
  version "1.1.2"
  sha256 "e061081861b4dc1802a4ce6523a5ac4bb2edd5047eb143530dd0fb0b5804c8ea"
  license "MIT"

  depends_on "corvidlabs/tap/attest"
  depends_on "corvidlabs/tap/augur"
  depends_on "corvidlabs/tap/fledge"
  depends_on "corvidlabs/tap/spec-sync"
  depends_on "python@3.11"

  def install
    libexec.install "plugin.toml", "bin", "scripts", "templates"
    python_path = "#{formula_opt_libexec("python@3.11")}/bin:$PATH"
    (bin/"fledge-trust").write_env_script libexec/"bin/fledge-trust", PATH: python_path
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fledge-trust --version")
    assert_match version.to_s, shell_output("fledge trust --version")
    assert_match "5.2.0", shell_output("specsync --version")
    assert_match "1.0.0", shell_output("augur --version")
    assert_match "1.0.0", shell_output("attest --version")
  end
end
