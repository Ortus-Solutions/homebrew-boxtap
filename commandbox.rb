class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.9.2/commandbox-bin-3.9.2.zip"
  sha256 "786f1cae55bca224052876cf0d1247d76f4c21737a51db8381198bc5a28d6938"

  devel do
    url "http://integration.stg.ortussolutions.com/artifacts/ortussolutions/commandbox/4.0.0-SNAPSHOT/commandbox-bin-4.0.0-SNAPSHOT.zip?build=00941"
    sha256 "38c23284a0a93439324b6073323973c6a0faee152abeabde2064f28ced7e62d1"
  end

  bottle :unneeded

  depends_on :java => "1.7+"

  resource "apidocs" do
    url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.9.2/commandbox-apidocs-3.9.2.zip"
    sha256 "58bf950b9701168f0fa725d45cd6ceb206fe7d5446565f54264462c71a17fcc3"
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
