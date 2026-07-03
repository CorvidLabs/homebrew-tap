class Fledge < Formula
  desc "Dev lifecycle CLI — one tool for the dev loop, any language"
  homepage "https://github.com/CorvidLabs/fledge"
  license "MIT"
  # NOTE: This file is updated POST-release by .github/workflows/post-release-formula.yml
  # in the fledge repo. Don't bump manually — shas don't exist at bump time.
  version "1.7.0"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/fledge/releases/download/v#{version}/fledge-macos-aarch64"
      sha256 "21d0916d52ef14e6d33e3967417773369e047a0311e66bbb1eecc8f69332a040"

      def install
        bin.install "fledge-macos-aarch64" => "fledge"
      end
    end

    on_intel do
      url "https://github.com/CorvidLabs/fledge/releases/download/v#{version}/fledge-macos-x86_64"
      sha256 "9b93babd60f87dc67c1df1902b35ab71c06912a267821c05688e6cd842c71072"

      def install
        bin.install "fledge-macos-x86_64" => "fledge"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/CorvidLabs/fledge/releases/download/v#{version}/fledge-linux-x86_64"
      sha256 "9a2c5a0db698811052ad741dd8da5a3e8af5e46797f11b6cc59dffbd49917170"

      def install
        bin.install "fledge-linux-x86_64" => "fledge"
      end
    end
  end

  def caveats
    <<~EOS
      To generate shell completions:
        fledge completions bash > $(brew --prefix)/etc/bash_completion.d/fledge
        fledge completions zsh > $(brew --prefix)/share/zsh/site-functions/_fledge
        fledge completions fish > $(brew --prefix)/share/fish/vendor_completions.d/fledge.fish
    EOS
  end

  test do
    assert_match "fledge", shell_output("#{bin}/fledge --version")
  end
end
