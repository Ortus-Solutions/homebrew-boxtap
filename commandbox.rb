class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.4.2/commandbox-bin-5.4.2.zip"
  sha256 "88de96d481d32fd8e42b18e12492d1d1cf6cb70a8a1368d192ba7e8f3da9829a"
  license "LGPL-3.0-or-later"

  head do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.5.0-alpha/commandbox-bin-5.5.0-alpha.zip?build=00522"
    sha256 "53d276832bffd78fe3f2116de8759e407fe823a85a6f6650fcb992be38ea212d"
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
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.4.2/commandbox-apidocs-5.4.2.zip"
    sha256 "66c040230f3a2e2d3b03023d895416b271e62a7da264f25e3df02040099e67fc"
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
