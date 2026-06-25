class Commandbox < Formula
  desc "CLI, Package Manager, and Embedded Server for BoxLang, Java, and CFML applications"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.3.3/commandbox-bin-6.3.3.zip"
  sha256 "7f4c49758939fc99c7ddc7ceffc322bcdb5d591605e7110097190bdd2bda5c84"
  license "Apache-2.0"

  head do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.4.0-alpha/commandbox-bin-6.4.0-alpha.zip?build=00862"
    sha256 "9d62850cc8194d46a2841660e580d4956fb94ea5cc570b25ad2977bb131b676e"
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
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.3.3/commandbox-apidocs-6.3.3.zip"
    sha256 "440c37353719fcf871b71b4daf0b90f52222494a7bfc31b722f55337c6f41560"
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
