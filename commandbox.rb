class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.3.1/commandbox-bin-5.3.1.zip"
  sha256 "e742098177813224410e157ae9076b83f2c99101a8a5b958ce0bbff365e8b5c2"
  license "LGPL-3.0-or-later"

  head do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.3.1/commandbox-bin-5.3.1.zip?build=00391"
    sha256 "e742098177813224410e157ae9076b83f2c99101a8a5b958ce0bbff365e8b5c2"
  end

  livecheck do
    url :homepage
    regex(/Download CommandBox v?(\d+(?:\.\d+)+)/i)
  end

  depends_on "openjdk"

  resource "apidocs" do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.3.1/commandbox-apidocs-5.3.1.zip"
    sha256 "48e3317aa3271b1fc0a2b311e79801b8dbad041bd74cb850d8085cd09ec18ab8"
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
