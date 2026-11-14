# Rendered by .github/scripts/render-packaging.sh from packaging/homebrew/korg.rb.in.
# Lives in the tap repo archhaze24/homebrew-tap as Formula/korg.rb.
# Linux uses the static musl builds, so no particular glibc is required.
# korg needs opusenc and rsgain at run time, which is why they are dependencies.
class Korg < Formula
  desc "Kirby's music organizer: covers, synced lyrics, FLAC to Opus, ReplayGain"
  homepage "https://github.com/archhaze24/korg"
  version "0.1.0"
  license "MIT"

  depends_on "opus-tools"
  depends_on "rsgain"

  on_macos do
    on_arm do
      url "https://github.com/archhaze24/korg/releases/download/v0.1.0/korg-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "bdf5d144cc173d1224e82622b7448f27f3ed472e07d87e24f1656f633ddf12f2"
    end
    on_intel do
      url "https://github.com/archhaze24/korg/releases/download/v0.1.0/korg-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "d14f9bbf265224d2bb1d976bb417c4120f8d698a2f45bc91e3b412174e78fe43"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/archhaze24/korg/releases/download/v0.1.0/korg-v0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5a6800647b02f6e1d7316911d81a705d6d03d339b822f36ddac6582b6f535c20"
    end
    on_intel do
      url "https://github.com/archhaze24/korg/releases/download/v0.1.0/korg-v0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e44800cb04b36524f9b3ee28a5db20b0345aecd46623c0c1d45839990f490237"
    end
  end

  def install
    bin.install "korg"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/korg --version")
  end
end
