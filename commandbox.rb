class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.2.1/commandbox-bin-5.2.1.zip"
  sha256 "fdde1f8146e9f6105e396d3c42a1ec34fbaf6ef4f74eef78fb33b091f36e95b8"
  license "LGPL-3.0-or-later"

  head do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.3.0-alpha/commandbox-bin-5.3.0-alpha.zip?build=00042"
    sha256 "42a5571ec4dbf0274e402ce746154c12283f7538a2234463dffa0c2be50c4126"
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
