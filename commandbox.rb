class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.7.0/commandbox-bin-3.7.0.zip"
  sha256 "be68b4dc533895d5b23c3e5382c70287aa3cbfec1605ca107492c04eb58ab8f5"

  devel do
    url "http://integration.stg.ortussolutions.com/artifacts/ortussolutions/commandbox/3.7.0/commandbox-bin-3.7.0.zip?build=00746"
    sha256 "be68b4dc533895d5b23c3e5382c70287aa3cbfec1605ca107492c04eb58ab8f5"
  end

  bottle :unneeded

  depends_on :java => "1.7+"

  resource "apidocs" do
    url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.7.0/commandbox-apidocs-3.7.0.zip"
    sha256 "ca280867830891eb700b6a0049a723145d344eebea1eb4b0ef46421be73a7ef4"
  end

  def install
    bin.install "box"
    doc.install resource("apidocs")
  end

  test do
    system "#{bin}/box", "--commandbox_home=~/", "version"
    system "#{bin}/box", "--commandbox_home=~/", "help"
  end
end
