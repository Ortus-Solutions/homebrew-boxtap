class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.2.1/commandbox-bin-5.2.1.zip"
  sha256 "fdde1f8146e9f6105e396d3c42a1ec34fbaf6ef4f74eef78fb33b091f36e95b8"
  license "LGPL-3.0-or-later"

  head do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.3.0-alpha/commandbox-bin-5.3.0-alpha.zip?build=00313"
    sha256 "c13e5e48475cc5dc6a03634e70f6b67f0a00234a4748f6c8bdbefe4ce3068e80"
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
