class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.5.0/commandbox-bin-3.5.0.zip"
  sha256 "0e5777ebbd2d9ca0dbb447a26cc07c4075c888f6dfe672501a64c04eca716ae2"

  devel do
    url "http://integration.stg.ortussolutions.com/artifacts/ortussolutions/commandbox/3.5.0/commandbox-bin-3.5.0.zip?build=00599"
    sha256 "0e5777ebbd2d9ca0dbb447a26cc07c4075c888f6dfe672501a64c04eca716ae2"
  end

  bottle :unneeded

  depends_on :java => "1.7+"

  resource "apidocs" do
    url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.5.0/commandbox-apidocs-3.5.0.zip"
    sha256 "709330fffdafc8d940899149feaf3e08b0d9ec4163d47de42be91b3265b15b8a"
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
