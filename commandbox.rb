class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.2.1/commandbox-bin-5.2.1.zip"
  sha256 "fdde1f8146e9f6105e396d3c42a1ec34fbaf6ef4f74eef78fb33b091f36e95b8"
  license "LGPL-3.0-or-later"

  head do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.3.0-alpha/commandbox-bin-5.3.0-alpha.zip?build=00046"
    sha256 "bab76372208e17e0df1dae300e8b203b89e8164346ed544067e31270758c4697"
  end

  livecheck do
    url :homepage
    regex(/Download CommandBox v?(\d+(?:\.\d+)+)/i)
  end

  bottle :unneeded

  depends_on "openjdk"

  resource "apidocs" do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.2.1/commandbox-apidocs-5.2.1.zip"
    sha256 "3c344079da98e2a56206e2141ce86e3fdb92b7e488677149cdf9021583d65d10"
  end

  def install
    (libexec/"bin").install "box"
    (bin/"box").write_env_script libexec/"bin/box", Language::Java.overridable_java_home_env
    doc.install resource("apidocs")
  end

  test do
    system "#{bin}/box", "--commandbox_home=~/", "version"
    system "#{bin}/box", "--commandbox_home=~/", "help"
  end
end
