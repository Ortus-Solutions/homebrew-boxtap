class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.4.0/commandbox-bin-5.4.0.zip"
  sha256 "0be40d16eee995c7b7c51b9d99be0ba0326647e3f546c71cf0ca94c53c43612d"
  license "LGPL-3.0-or-later"

  head do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.5.0-alpha/commandbox-bin-5.5.0-alpha.zip?build=00434"
    sha256 "29ed2e24fecf5c6b91e37a282dc1fc63a26ef41ecd368bf69d8940615a92f027"
  end

  livecheck do
    url :homepage
    regex(/Download CommandBox v?(\d+(?:\.\d+)+)/i)
  end

  bottle do
    sha256 cellar: :any_skip_relocation, all: "45b01d0263bf8842d6b060ed23202a77ab6b33d2a3c1c2a89be80eb4c50324ba"
  end

  depends_on "openjdk"

  resource "apidocs" do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.4.0/commandbox-apidocs-5.4.0.zip"
    sha256 "356b262a9bc388c491db54d6af9200f7653e0225cc86cd91ae430297ce0f01e3"
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
