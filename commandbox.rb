class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "http://www.ortussolutions.com/products/commandbox"
  url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.1.1/commandbox-bin-3.1.1.zip"
  sha256 "050bb737db3033a7ae8d47f2e5a973583963328c7ed1c3e1ab7b1191c609ac60"

  devel do
    url "http://integration.stg.ortussolutions.com/artifacts/ortussolutions/commandbox/3.1.1/commandbox-bin-3.1.1.zip"
    sha256 "050bb737db3033a7ae8d47f2e5a973583963328c7ed1c3e1ab7b1191c609ac60"
  end

  bottle :unneeded

  depends_on :java => "1.7+"

  resource "apidocs" do
    url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.1.1/commandbox-apidocs-3.1.1.zip"
    sha256 "3a1507ae40740f9e96c3d4d87e218a1d3e8feff35072f19ea69465c3676ab59f"
  end

  def install
    bin.install "box"
    doc.install resource("apidocs")
  end

  test do
    system "box", "--commandbox_home=~/", "version"
    system "box", "--commandbox_home=~/", "help"
  end
end
