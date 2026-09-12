class Commandbox < Formula
  desc "CLI, Package Manager, and Embedded Server for BoxLang, Java, and CFML applications"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.3.5/commandbox-bin-6.3.5.zip"
  sha256 "f8f5d31843724108f034a68d404d77a934d281108e1e21d510ae5b5a5db796f8"
  license "Apache-2.0"

  head do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.3.5/commandbox-bin-6.3.5.zip?build=00887"
    sha256 "f8f5d31843724108f034a68d404d77a934d281108e1e21d510ae5b5a5db796f8"
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
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.3.5/commandbox-apidocs-6.3.5.zip"
    sha256 "c3d45afc0e711b65b3b2c7d2b2a48d5a69d5e930fbab06491927c0c5968ef37f"
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
