class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.5.1/commandbox-bin-5.5.1.zip"
  sha256 "806b255f39d5a428a3a905d6d81c2dd61f1c9ba79949396e953745fdb1892a1e"
  license "LGPL-3.0-or-later"

  head do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.5.2-alpha/commandbox-bin-5.5.2-alpha.zip?build=00564"
    sha256 "c90ca773b5de9d1b72b81e70d79d531c5ca6d6bfa41af59341072a1989b032a2"
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
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.5.1/commandbox-apidocs-5.5.1.zip"
    sha256 "eadefdf7986127a3b64d76830f458dd1fa784dfb8e782d11f40fcdc979eaccbf"
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
