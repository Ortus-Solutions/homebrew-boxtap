class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.7.0/commandbox-bin-5.7.0.zip"
  sha256 "a45c30d12dd4805c48610b9948e48ed167a5f35cd4c8ce4a5b450b0e07514baf"
  license "LGPL-3.0-or-later"

  head do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.8.0-alpha/commandbox-bin-5.8.0-alpha.zip?build=00660"
    sha256 "ec48dadab554bf3382c20347395b007a88fddfe5d4be141525691b7ad2e544a1"
  end

  livecheck do
    url :homepage
    regex(/Download CommandBox v?(\d+(?:\.\d+)+)/i)
  end

  bottle do
    sha256 cellar: :any_skip_relocation, all: "45b01d0263bf8842d6b060ed23202a77ab6b33d2a3c1c2a89be80eb4c50324ba"
  end

  # not yet compatible with Java 17 on ARM
  depends_on "openjdk@11"

  resource "apidocs" do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.7.0/commandbox-apidocs-5.7.0.zip"
    sha256 "960c8363992e7bebf8d48c20a6680d9877d345eb552b908b8406007cf2c4d9a0"
  end

  def install
    (libexec/"bin").install "box"
    (bin/"box").write_env_script libexec/"bin/box", Language::Java.java_home_env("11")
    doc.install resource("apidocs")
  end

  test do
    system "#{bin}/box", "--commandbox_home=~/", "version"
    system "#{bin}/box", "--commandbox_home=~/", "help"
  end
end
