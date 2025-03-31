class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.2.0/commandbox-bin-6.2.0.zip"
  sha256 "43cf4d34db625648b7e0c5fccba57324550e2c451190f25a7d2b80b7fbb985dd"
  license "Apache-2.0"

  head do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.3.0-alpha/commandbox-bin-6.3.0-alpha.zip?build=00827"
    sha256 "88741a6d65bce40bc395d3497c2b264d339c468ed867dbd63ad57d8ac2553d4b"
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
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.2.0/commandbox-apidocs-6.2.0.zip"
    sha256 "9be83e1950ebaed77bd8f705f527280fc1de86d1fe39acba422fcf6517475c74"
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
