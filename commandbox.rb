class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.9.1/commandbox-bin-3.9.1.zip"
  sha256 "5eb31dffd92b9e3c0077a4f0e94ccaecd69726561ca36ea186b9e2f9b63d5872"

  devel do
    url "http://integration.stg.ortussolutions.com/artifacts/ortussolutions/commandbox/3.9.2-SNAPSHOT/commandbox-bin-3.9.2-SNAPSHOT.zip?build=00825"
    sha256 "45a868fd461159e0343ef515bda69c12989933b3c14a2e7e05631320cbb23f53"
  end

  bottle :unneeded

  depends_on :java => "1.7+"

  resource "apidocs" do
    url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.9.1/commandbox-apidocs-3.9.1.zip"
    sha256 "16e4c1fb6e8e8f8085938930479e950d5f86e110d51fc81b9f3c66b404f9465b"
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
