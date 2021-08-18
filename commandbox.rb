class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.4.0/commandbox-bin-5.4.0.zip"
  sha256 "1cc8924a099a1e0b735e603a03b5546a6afd3d3f213771715b23b2fc02095390"
  license "LGPL-3.0-or-later"

  head do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.4.0/commandbox-bin-5.4.0.zip?build=00430"
    sha256 "1cc8924a099a1e0b735e603a03b5546a6afd3d3f213771715b23b2fc02095390"
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
    sha256 "b14c1738b51bffd32a4a3298e0c17d390ce7a7035fb1d7e4d1c57f14a841d7bd"
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
