class Commandbox < Formula
  desc "CLI, Package Manager, and Embedded Server for BoxLang, Java, and CFML applications"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.3.1/commandbox-bin-6.3.1.zip"
  sha256 "df07ddd13d1eb819fb0c3f35ffaa89007b1934dcfe18051679fc8806861007bd"
  license "Apache-2.0"

  head do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.3.1/commandbox-bin-6.3.1.zip?build=00853"
    sha256 "df07ddd13d1eb819fb0c3f35ffaa89007b1934dcfe18051679fc8806861007bd"
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
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.3.1/commandbox-apidocs-6.3.1.zip"
    sha256 "2abfd7d4acf2bb24df7b9ced669a94d6f1151fd027b0b7ca788e4ab8a0f83df7"
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
