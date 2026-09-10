class CorvidTrust < Formula
  desc "Unified lifecycle, contract, risk, and provenance gate"
  homepage "https://github.com/CorvidLabs/trust"
  url "https://github.com/CorvidLabs/trust/archive/refs/tags/v1.2.0.tar.gz"
  version "1.2.0"
  sha256 "dad5a5d3ea7ccff5c5e299ba4132168b9866420a195c78ec1c6293256da985e9"
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
    assert_match "6.0.0", shell_output("specsync --version")
    assert_match "1.0.0", shell_output("augur --version")
    assert_match "1.0.0", shell_output("attest --version")
  end
end
