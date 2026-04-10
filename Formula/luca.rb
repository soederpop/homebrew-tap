class Luca < Formula
  desc "Lightweight Universal Conversational Architecture - AI-native TypeScript framework"
  homepage "https://luca-js.soederpop.com"
  version "0.3.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soederpop/luca/releases/download/v0.3.7/luca-darwin-arm64.zip"
      sha256 "956834dc555a8616f631fbbbd7f272f732f55d8f96ae892931a3b71ceda944d7"
    else
      url "https://github.com/soederpop/luca/releases/download/v0.3.7/luca-darwin-x64.zip"
      sha256 "0bae654a6cc1920d93514aa3b809471aadaf079f10bfb5c9d334c51bb2479ff1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soederpop/luca/releases/download/v0.3.7/luca-linux-arm64"
      sha256 "021d418a1fa527cb5f1694fb4232c38f55c7dbbf4cab764aac650e2c549a0e2a"
    else
      url "https://github.com/soederpop/luca/releases/download/v0.3.7/luca-linux-x64"
      sha256 "6511b4ef3f0c605e54eb89c34707cd91d961b0bf45396c35ea1372170a2dc884"
    end
  end

  def install
    if OS.mac?
      bin.install "dist/release/luca-darwin-#{Hardware::CPU.arm? ? "arm64" : "x64"}" => "luca"
    else
      bin.install "luca-linux-#{Hardware::CPU.arm? ? "arm64" : "x64"}" => "luca"
    end
  end

  test do
    system "#{bin}/luca", "--version"
  end
end
