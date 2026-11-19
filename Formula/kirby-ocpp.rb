# Rendered by .github/scripts/render-packaging.sh from packaging/homebrew/kirby-ocpp.rb.in.
# Lives in the tap repo archhaze24/homebrew-tap as Formula/kirby-ocpp.rb.
# Linux uses the static musl builds, so no particular glibc is required.
class KirbyOcpp < Formula
  desc "OCPP 1.6J and 2.0.1 charge point emulator (kirby-ocpp) and central system (kirby-csms) for testing"
  homepage "https://github.com/archhaze24/kirby-ocpp"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/archhaze24/kirby-ocpp/releases/download/v0.7.0/kirby-ocpp-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "f5c11624429107afa163ba942bd074366df5b99908dcd9d395aa41d613f87307"
    end
    on_intel do
      url "https://github.com/archhaze24/kirby-ocpp/releases/download/v0.7.0/kirby-ocpp-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "77150e9a790ecebc9515a33e7d2a20ff32f7887c22672eb5b10bdad9a68e1123"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/archhaze24/kirby-ocpp/releases/download/v0.7.0/kirby-ocpp-v0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6340a91ca7deaa78c2c432e8277cedd4bd0004b081da6bea32ebec7a15cb222c"
    end
    on_intel do
      url "https://github.com/archhaze24/kirby-ocpp/releases/download/v0.7.0/kirby-ocpp-v0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4eeb10809ee15c1e775960c128d4c66749a1f781922889b82f8c8d0bf7fa833c"
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
