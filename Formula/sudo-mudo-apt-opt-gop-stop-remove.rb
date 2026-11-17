# rendered by .github/scripts/render-packaging.sh from packaging/homebrew/sudo-mudo-apt-opt-gop-stop-remove.rb.in.
# lives in the tap repo archhaze24/homebrew-tap as Formula/sudo-mudo-apt-opt-gop-stop-remove.rb.
# linux uses the static musl builds, so no particular glibc is required.
class SudoMudoAptOptGopStopRemove < Formula
  desc "when you really want to nuke the shit out of some files"
  homepage "https://github.com/thisislinuxmasterrace/sudo-mudo-apt-opt-gop-stop-remove"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thisislinuxmasterrace/sudo-mudo-apt-opt-gop-stop-remove/releases/download/v0.2.1/sudo-mudo-apt-opt-gop-stop-remove-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "b328e17aa9e2c15d65d4359565fd13bfa94fb9d68061ebd55afa8d125c95b09f"
    end
    on_intel do
      url "https://github.com/thisislinuxmasterrace/sudo-mudo-apt-opt-gop-stop-remove/releases/download/v0.2.1/sudo-mudo-apt-opt-gop-stop-remove-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "d418273bc09f8577df7fa11288129653764e0c89c46504b30c4eea4ccc199d32"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thisislinuxmasterrace/sudo-mudo-apt-opt-gop-stop-remove/releases/download/v0.2.1/sudo-mudo-apt-opt-gop-stop-remove-v0.2.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e4c62f351eeb6dd1479534baa1bc4369c3058d8a52ea61df3ead273fef868939"
    end
    on_intel do
      url "https://github.com/thisislinuxmasterrace/sudo-mudo-apt-opt-gop-stop-remove/releases/download/v0.2.1/sudo-mudo-apt-opt-gop-stop-remove-v0.2.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ec71431773f42b3b0dfc9f2269e1db8d978904225fa3a14233cdff6f1eebc34c"
    end
  end

  def install
    bin.install "mudo"
    man1.install Dir["man/man1/*.1"]
    bash_completion.install "completions/mudo.bash" => "mudo"
    zsh_completion.install "completions/_mudo"
    fish_completion.install "completions/mudo.fish"
  end

  test do
    assert_match "run with sudo", shell_output("#{bin}/mudo apt opt gop stop remove --version 2>&1", 1)
  end
end
