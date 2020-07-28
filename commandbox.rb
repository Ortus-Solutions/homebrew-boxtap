class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.1.1/commandbox-bin-5.1.1.zip"
  sha256 "0b6b358ae2466297a7ddbd16d72a8b8a83c66d3f6cada0c8ff1e786d2a88af8b"

  devel do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.2.0-alpha/commandbox-bin-5.2.0-alpha.zip?build=00218"
    sha256 "f56d5bc7d28941c9e0d1c070f7511c846e8fac1975f90507c538931cb3291bac"
  end

  bottle :unneeded

  depends_on "openjdk"

  resource "apidocs" do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.1.1/commandbox-apidocs-5.1.1.zip"
    sha256 "81611cd5d6d7f5d33ca26672faeb06ec0e46e9796c986a05947ed3d460d7a7fb"
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
