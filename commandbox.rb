class Commandbox < Formula
  desc "CLI, Package Manager, and Embedded Server for BoxLang, Java, and CFML applications"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.3.0/commandbox-bin-6.3.0.zip"
  sha256 "f5c32c8127bd5f9a6605a652fc6ae98b447c5e7e2d1bb94a7af4fdd13dc79dfb"
  license "Apache-2.0"

  head do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.4.0-alpha/commandbox-bin-6.4.0-alpha.zip?build=00851"
    sha256 "6a9d7519a0cffefcb2d2fc5222fb434732e21dcb9808d32ddf5eb10701b49c79"
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
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.3.0/commandbox-apidocs-6.3.0.zip"
    sha256 "853c0eb5cd80bacf8529fc640d0507e1c2759a51c181a49da01c7dc55779ab5e"
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
