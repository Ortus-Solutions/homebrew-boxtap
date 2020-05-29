class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.1.0/commandbox-bin-5.1.0.zip"
  sha256 "cd5a903cc4874930bfd9437e46240f7a980ff7f28c1e136299dc525c47d5ff28"

  devel do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.1.1-alpha/commandbox-bin-5.1.1-alpha.zip?build=00189"
    sha256 "0f437672fc8010858c45d49739812ecd551dc61a561957c1ee93e8b7cf8159e3"
  end

  bottle :unneeded

  depends_on "openjdk"

  resource "apidocs" do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.1.0/commandbox-apidocs-5.1.0.zip"
    sha256 "e28e2ea76f661bdd0277a730ba3fb963ce74c86f990b565ef4748e7021fcd056"
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
