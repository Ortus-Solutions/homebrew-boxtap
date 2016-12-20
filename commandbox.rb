class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.4.0/commandbox-bin-3.4.0.zip"
  sha256 "b8476782943ee2a39d7e6ee79c491e5e0539a63300196cb695e901dfdd308e42"

  devel do
    url "http://integration.stg.ortussolutions.com/artifacts/ortussolutions/commandbox/3.4.1-snapshot/commandbox-bin-3.4.1-snapshot.zip?build=00584"
    sha256 "c4159dd632ae5d2d96ddb6d3f4a9e7f141fcb6173903cb07b81dd82c333abe96"
  end

  bottle :unneeded

  depends_on :java => "1.7+"

  resource "apidocs" do
    url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.4.0/commandbox-apidocs-3.4.0.zip"
    sha256 "37299d470cc55f4ac21dca3d78db7a002b2422d3af3f3614b42e90a360416629"
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
