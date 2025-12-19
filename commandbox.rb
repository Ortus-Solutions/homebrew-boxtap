class Commandbox < Formula
  desc "CLI, Package Manager, and Embedded Server for BoxLang, Java, and CFML applications"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.2.1/commandbox-bin-6.2.1.zip"
  sha256 "c8f4c9befda31046fd535542024b21ae121ce12fa517f6c1405f88b432ce1f1a"
  license "Apache-2.0"

  head do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.3.0-alpha/commandbox-bin-6.3.0-alpha.zip?build=00847"
    sha256 "797343ed19aaf7e9adbb69bd857207ad0eb4ffad35b182ef04354fb04309386e"
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
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.2.1/commandbox-apidocs-6.2.1.zip"
    sha256 "ff1c3eed5fd1036de851b57a6be25041844ca00516b7aa4ce6d1365eb8be47d5"
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
