class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.4.1/commandbox-bin-5.4.1.zip"
  sha256 "7821675ba886db995f1624aa8d991b9b5e303bd7a998ea415d1aa5bee5d3eff3"
  license "LGPL-3.0-or-later"

  head do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.4.2-rc/commandbox-bin-5.4.2-rc.zip?build=00449"
    sha256 "f2d81d18a2e4a7c46c0c67adcd08d76cfd26ad30d32107a28d5ce098305ec79f"
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
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.4.1/commandbox-apidocs-5.4.1.zip"
    sha256 "76f76acf8e81cd27fce14a790bf128d05ccb431bc2cc082e2c820fabd6d0a3e7"
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
