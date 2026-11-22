# Rendered by .github/scripts/render-packaging.sh from packaging/homebrew/kirby-ocpp.rb.in.
# Lives in the tap repo archhaze24/homebrew-tap as Formula/kirby-ocpp.rb.
# Linux uses the static musl builds, so no particular glibc is required.
class KirbyOcpp < Formula
  desc "OCPP 1.6J, 2.0.1 and 2.1 charge point emulator (kirby-ocpp) and central system (kirby-csms) for testing"
  homepage "https://github.com/archhaze24/kirby-ocpp"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/archhaze24/kirby-ocpp/releases/download/v0.8.0/kirby-ocpp-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "3a4cb3cecdd32bc71a79e631d542bb1e13f19a94bfcab7c61a93093ef7a744c4"
    end
    on_intel do
      url "https://github.com/archhaze24/kirby-ocpp/releases/download/v0.8.0/kirby-ocpp-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "51b8fe6bea86634391549826c5e4e7ebf49216692e458e091b2c9a44d6e1790d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/archhaze24/kirby-ocpp/releases/download/v0.8.0/kirby-ocpp-v0.8.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7d300d971a6a41fcb3e6b7754b3bde4f6671d24da2b1776d1629bee3b4145664"
    end
    on_intel do
      url "https://github.com/archhaze24/kirby-ocpp/releases/download/v0.8.0/kirby-ocpp-v0.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3d24969969f8e3eabcc112b38113011b63847ff9f8d818cfe161a8abb9fee60b"
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
