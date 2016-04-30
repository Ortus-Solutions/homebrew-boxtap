class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "http://www.ortussolutions.com/products/commandbox"
  url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.0.1/commandbox-bin-3.0.1.zip"
  sha256 "b5f821f5c327f5387a7cdf20855510fe39c1770dd2f0f383c4576519bae3d5d9"

  devel do
    url "http://integration.stg.ortussolutions.com/artifacts/ortussolutions/commandbox/3.1.0/commandbox-bin-3.1.0.zip"
    sha256 "4a5a83d6c08b4dc490f84b0a6aab2989355e5e28f4de26adabcad4fa506f52ad"
  end

  bottle :unneeded

  depends_on :java => "1.7+"

  resource "apidocs" do
    url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.0.1/commandbox-apidocs-3.0.1.zip"
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
