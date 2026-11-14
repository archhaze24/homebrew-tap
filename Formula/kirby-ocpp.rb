# Rendered by .github/scripts/render-packaging.sh from packaging/homebrew/kirby-ocpp.rb.in.
# Lives in the tap repo archhaze24/homebrew-tap as Formula/kirby-ocpp.rb.
# Linux uses the static musl builds, so no particular glibc is required.
class KirbyOcpp < Formula
  desc "OCPP 1.6J charge point emulator (kirby-ocpp) and central system (kirby-csms) for testing"
  homepage "https://github.com/archhaze24/kirby-ocpp"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/archhaze24/kirby-ocpp/releases/download/v0.6.0/kirby-ocpp-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "46d451792866ee03282079b7c58779182d7b2fd6a3c4201cbd230e514bd6286d"
    end
    on_intel do
      url "https://github.com/archhaze24/kirby-ocpp/releases/download/v0.6.0/kirby-ocpp-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "70c2ddf6917566336283fa752d141cc109a37cfbb24a88f578dd8cfe3426d692"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/archhaze24/kirby-ocpp/releases/download/v0.6.0/kirby-ocpp-v0.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "faa88fa8b754ec383be3d95cc3b1ce9d9b3f8c04c52d287aadf9b7d4226de85b"
    end
    on_intel do
      url "https://github.com/archhaze24/kirby-ocpp/releases/download/v0.6.0/kirby-ocpp-v0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3ffad97ee036da751994b9af413d6196a30c14b38fa68b33efae2972027d546b"
    end
  end

  def install
    bin.install "kirby-ocpp", "kirby-csms"
    man1.install Dir["man/man1/*.1"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kirby-ocpp --version")
    assert_match version.to_s, shell_output("#{bin}/kirby-csms --version")
  end
end
