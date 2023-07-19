class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.9.0/commandbox-bin-5.9.0.zip"
  sha256 "bff6ab849bda323d8182f63fbf89fc1873633c15b99744f248f6fe0ad4011a2e"
  license "LGPL-3.0-or-later"

  head do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.0.0-alpha/commandbox-bin-6.0.0-alpha.zip?build=00759"
    sha256 "25fd84999ae4d723c271a707b3c1fc919d826bb7b6168b86106caf0961996330"
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
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.9.0/commandbox-apidocs-5.9.0.zip"
    sha256 "b9a35a500c585a8248ddf81a6631d264c5681e259e501010aeef8f2830cafdfb"
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
