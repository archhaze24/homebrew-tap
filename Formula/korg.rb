# Rendered by .github/scripts/render-packaging.sh from packaging/homebrew/korg.rb.in.
# Lives in the tap repo archhaze24/homebrew-tap as Formula/korg.rb.
# Linux uses the static musl builds, so no particular glibc is required.
# korg needs opusenc and rsgain at run time, which is why they are dependencies.
class Korg < Formula
  desc "Kirby's music organizer: covers, synced lyrics, FLAC to Opus, ReplayGain"
  homepage "https://github.com/archhaze24/korg"
  version "0.2.0"
  license "MIT"

  depends_on "opus-tools"
  depends_on "rsgain"

  on_macos do
    on_arm do
      url "https://github.com/archhaze24/korg/releases/download/v0.2.0/korg-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "b0c3ac0e54438c90a6698d10a1ca29ba5d57aa316d1a3a94893879b9c41e841a"
    end
    on_intel do
      url "https://github.com/archhaze24/korg/releases/download/v0.2.0/korg-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "c8994639324c02f585572d894e0c75c61d4717c380be417ba3bc69dd45e9eb52"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/archhaze24/korg/releases/download/v0.2.0/korg-v0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "547e1578777d2a24101ebf411ebb6acd655a745b5ca355f617cb44f636791f70"
    end
    on_intel do
      url "https://github.com/archhaze24/korg/releases/download/v0.2.0/korg-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c4b824dd0cf42ddfad52ad23b04d3d92745cfd636185d0f47c9e708825f534e5"
    end
  end

  def install
    bin.install "korg"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/korg --version")
  end
end
