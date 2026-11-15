# rendered by .github/scripts/render-packaging.sh from packaging/homebrew/sudo-mudo-apt-opt-gop-stop-remove.rb.in.
# lives in the tap repo archhaze24/homebrew-tap as Formula/sudo-mudo-apt-opt-gop-stop-remove.rb.
# linux uses the static musl builds, so no particular glibc is required.
class SudoMudoAptOptGopStopRemove < Formula
  desc "when you really want to nuke the shit out of some files"
  homepage "https://github.com/thisislinuxmasterrace/sudo-mudo-apt-opt-gop-stop-remove"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thisislinuxmasterrace/sudo-mudo-apt-opt-gop-stop-remove/releases/download/v0.2.0/sudo-mudo-apt-opt-gop-stop-remove-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "414a4cc26e091bb0d716faf2f3f9dc740d1a3690c4c75f5954f9f6ddaf775549"
    end
    on_intel do
      url "https://github.com/thisislinuxmasterrace/sudo-mudo-apt-opt-gop-stop-remove/releases/download/v0.2.0/sudo-mudo-apt-opt-gop-stop-remove-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "e8d9b76f3eb999077e0f07ae52be3bd27729ba8ce5a566fb99b58f1dbd5a18e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thisislinuxmasterrace/sudo-mudo-apt-opt-gop-stop-remove/releases/download/v0.2.0/sudo-mudo-apt-opt-gop-stop-remove-v0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "65bd262ae5c20b92046bac4ee5c0457fc115264fb97d5c35dedd1698dc663875"
    end
    on_intel do
      url "https://github.com/thisislinuxmasterrace/sudo-mudo-apt-opt-gop-stop-remove/releases/download/v0.2.0/sudo-mudo-apt-opt-gop-stop-remove-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "602e86b007cd4ddabd7725368b583153ac6c1837553e23fbc33a622cb972e6d7"
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
