# Rendered by .github/scripts/render-packaging.sh from packaging/homebrew/kirby-ocpp.rb.in.
# Lives in the tap repo archhaze24/homebrew-tap as Formula/kirby-ocpp.rb.
# Linux uses the static musl builds, so no particular glibc is required.
class KirbyOcpp < Formula
  desc "OCPP 1.6J charge point emulator (kirby-ocpp) and central system (kirby-csms) for testing"
  homepage "https://github.com/archhaze24/kirby-ocpp"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/archhaze24/kirby-ocpp/releases/download/v0.5.0/kirby-ocpp-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "74d791d51537b3cd097f04cb360dba9beede22f8656f3ea667f1a80f43772404"
    end
    on_intel do
      url "https://github.com/archhaze24/kirby-ocpp/releases/download/v0.5.0/kirby-ocpp-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "9f7127d443d41f01ac381d5bbe872a9b89fd3db0005c3b177fe6571fac9965cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/archhaze24/kirby-ocpp/releases/download/v0.5.0/kirby-ocpp-v0.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "61325f5a65fb1a80cceb01acf8febb418b20d0cd7031587a6c8456dcb55f7b80"
    end
    on_intel do
      url "https://github.com/archhaze24/kirby-ocpp/releases/download/v0.5.0/kirby-ocpp-v0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b98b38714a2ae2f95efda36ca8d016dc8855a88db1252ab85b8490931650068b"
    end
  end

  def install
    bin.install "kirby-ocpp", "kirby-csms"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kirby-ocpp --version")
    assert_match version.to_s, shell_output("#{bin}/kirby-csms --version")
  end
end
