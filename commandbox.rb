class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.5.0/commandbox-bin-3.5.0.zip"
  sha256 "32086d9be3b5bcc7aac2a54b931d959bea65e0f5b0b87da86155240c4c8746d5"

  devel do
    url "http://integration.stg.ortussolutions.com/artifacts/ortussolutions/commandbox/3.5.0/commandbox-bin-3.5.0.zip?build=00598"
    sha256 "32086d9be3b5bcc7aac2a54b931d959bea65e0f5b0b87da86155240c4c8746d5"
  end

  bottle :unneeded

  depends_on :java => "1.7+"

  resource "apidocs" do
    url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.5.0/commandbox-apidocs-3.5.0.zip"
    sha256 "29896b2ce3646763207dc41dc9ff71b5a7797ad6b5ee40d962c4609492d47bb1"
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
