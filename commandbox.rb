class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.1.0/commandbox-bin-6.1.0.zip"
  sha256 "2bbf025ced8ae99fd7edb8f09c8a66ed0df095e45d2474f69e7d7e07fb55066b"
  license "Apache-2.0"

  head do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.2.0-alpha/commandbox-bin-6.2.0-alpha.zip?build=00814"
    sha256 "15dbedd955287fa2c5f538305ac2798beeb78b589d3deea308d466b14a6ed477"
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
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.1.0/commandbox-apidocs-6.1.0.zip"
    sha256 "f4bf29732cc97cfd1ef6bd11af3bed0cb9423030b2365af9806eeb8ff83ffa00"
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
