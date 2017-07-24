class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.7.0/commandbox-bin-3.7.0.zip"
  sha256 "c3bff63e0486d96e98c335a18ec2a3796228a021e53111a87fefe83d1c5d9ea3"

  devel do
    url "http://integration.stg.ortussolutions.com/artifacts/ortussolutions/commandbox/3.8.0-SNAPSHOT/commandbox-bin-3.8.0-SNAPSHOT.zip?build=00750"
    sha256 "99bf589c907b8eafcfdd08efac521f7baae27c3a47a0a54b4e5ed42c14dedc66"
  end

  bottle :unneeded

  depends_on :java => "1.7+"

  resource "apidocs" do
    url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.7.0/commandbox-apidocs-3.7.0.zip"
    sha256 "aab61f452e7cd71fc2fb24f87fee2f15ee0f50eda9e537193b54ef730d4a6445"
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
