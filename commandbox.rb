class Commandbox < Formula
  desc "CLI, Package Manager, and Embedded Server for BoxLang, Java, and CFML applications"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.3.4/commandbox-bin-6.3.4.zip"
  sha256 "266c21ca3d0ab46a8cbfcdbe4ffdb4f059fe439768f8fb5397e3a931a4623b4b"
  license "Apache-2.0"

  head do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.3.4/commandbox-bin-6.3.4.zip?build=00883"
    sha256 "266c21ca3d0ab46a8cbfcdbe4ffdb4f059fe439768f8fb5397e3a931a4623b4b"
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
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.3.4/commandbox-apidocs-6.3.4.zip"
    sha256 "8be5b3181ecd66bc94a2a60936e00ca6d4011727b98234361aefd7add75c890c"
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
