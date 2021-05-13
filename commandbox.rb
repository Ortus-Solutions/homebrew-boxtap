class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.3.0/commandbox-bin-5.3.0.zip"
  sha256 "a3bb2f1a76c72648171dbce716b3987ee415a249beb3a29c6e1fbf0a8aa267a9"
  license "LGPL-3.0-or-later"

  head do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.3.1-alpha/commandbox-bin-5.3.1-alpha.zip?build=00383"
    sha256 "aac08e54ccefd0edfec9f5cb9febd3b34c13989e98b737323eaa20c79d3674c8"
  end

  livecheck do
    url :homepage
    regex(/Download CommandBox v?(\d+(?:\.\d+)+)/i)
  end

  depends_on "openjdk"

  resource "apidocs" do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.3.0/commandbox-apidocs-5.3.0.zip"
    sha256 "b23cc4ea95a2eeca036a02e5b56e91de52ff203f223246d3452df0903699e996"
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
