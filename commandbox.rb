class Commandbox < Formula
  desc "CLI, Package Manager, and Embedded Server for BoxLang, Java, and CFML applications"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.3.2/commandbox-bin-6.3.2.zip"
  sha256 "f1f271a15d4c2281c6adb145972d963d44f4624ab52fce44dad326f32f283e56"
  license "Apache-2.0"

  head do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.3.2/commandbox-bin-6.3.2.zip?build=00857"
    sha256 "f1f271a15d4c2281c6adb145972d963d44f4624ab52fce44dad326f32f283e56"
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
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.3.2/commandbox-apidocs-6.3.2.zip"
    sha256 "9dbcb1c7dce3d5154a85f4e3e79c235ce16922c6c6b0f5e59ee366f2682ee27b"
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
