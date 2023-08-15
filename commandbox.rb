class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.9.1/commandbox-bin-5.9.1.zip"
  sha256 "d0f395dc8a27ff26528a5e6562d2c1b90770380387fe00cce9d3d1387e0ac466"
  license "LGPL-3.0-or-later"

  head do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.0.0-alpha/commandbox-bin-6.0.0-alpha.zip?build=00768"
    sha256 "e4d5bdf58e4c9fde44003c47b5916f1d0949428e198be011de7b3593145a3ecd"
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
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.9.1/commandbox-apidocs-5.9.1.zip"
    sha256 "3d9d57c2dd062fd370bb4e799b69f603af71fa7e0c7e4c62973af502837fb0ae"
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
