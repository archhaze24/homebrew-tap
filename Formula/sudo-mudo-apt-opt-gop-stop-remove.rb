# rendered by .github/scripts/render-packaging.sh from packaging/homebrew/sudo-mudo-apt-opt-gop-stop-remove.rb.in.
# lives in the tap repo archhaze24/homebrew-tap as Formula/sudo-mudo-apt-opt-gop-stop-remove.rb.
# linux uses the static musl builds, so no particular glibc is required.
class SudoMudoAptOptGopStopRemove < Formula
  desc "when you really want to nuke the shit out of some files"
  homepage "https://github.com/thisislinuxmasterrace/sudo-mudo-apt-opt-gop-stop-remove"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thisislinuxmasterrace/sudo-mudo-apt-opt-gop-stop-remove/releases/download/v0.1.0/sudo-mudo-apt-opt-gop-stop-remove-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "e3b540c63b2e5c451ad1966b8477a2bc21981218fc73315f3bb8dc13e5168a49"
    end
    on_intel do
      url "https://github.com/thisislinuxmasterrace/sudo-mudo-apt-opt-gop-stop-remove/releases/download/v0.1.0/sudo-mudo-apt-opt-gop-stop-remove-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "d9644a2d4dd2f0d63bd6ca4ed9584bf0459b1bdc06c0b3bfb850bde514712f63"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thisislinuxmasterrace/sudo-mudo-apt-opt-gop-stop-remove/releases/download/v0.1.0/sudo-mudo-apt-opt-gop-stop-remove-v0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a57ce9cb76e9ff65b8525e78d7a45d74212c7575b4b7ea101453f70be9628644"
    end
    on_intel do
      url "https://github.com/thisislinuxmasterrace/sudo-mudo-apt-opt-gop-stop-remove/releases/download/v0.1.0/sudo-mudo-apt-opt-gop-stop-remove-v0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fae338ba6280c6e42470e6d066deabe30ff52502bffa353695fa354f3cc66e3f"
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
