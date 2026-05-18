class Fledge < Formula
  desc "Dev lifecycle CLI — one tool for the dev loop, any language"
  homepage "https://github.com/CorvidLabs/fledge"
  license "MIT"
  # NOTE: This file is updated POST-release by .github/workflows/post-release-formula.yml
  # in the fledge repo. Don't bump manually — shas don't exist at bump time.
  version "1.4.2"

  on_macos do
    on_arm do
      url "https://github.com/CorvidLabs/fledge/releases/download/v#{version}/fledge-macos-aarch64"
      sha256 "d0d787baf0d68b238ae5cb63389c01e2866848aebfd3c8dc55e989a1b5a0da9f"

      def install
        bin.install "fledge-macos-aarch64" => "fledge"
      end
    end

    on_intel do
      url "https://github.com/CorvidLabs/fledge/releases/download/v#{version}/fledge-macos-x86_64"
      sha256 "bad906a974c508ea5f2ae165a244b52d695b739550da4ff3aa8133bba0029974"

      def install
        bin.install "fledge-macos-x86_64" => "fledge"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/CorvidLabs/fledge/releases/download/v#{version}/fledge-linux-x86_64"
      sha256 "244ed751087c20488faaf37496cb5cc3c8a60abf04e102d21a85b031e429b9e5"

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
