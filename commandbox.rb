class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.5.0/commandbox-bin-3.5.0.zip"
  sha256 "9477d83616124833f3e95b9e47391c4e61cfe4197b7d02d2d83b92e85219702c"

  devel do
    url "http://integration.stg.ortussolutions.com/artifacts/ortussolutions/commandbox/3.5.1-snapshot/commandbox-bin-3.5.1-snapshot.zip?build=00602"
    sha256 "5b9f0cd1082ed5533295ea8d16b9204082d7de07358891a07ee96d3669ce6ab7"
  end

  bottle :unneeded

  depends_on :java => "1.7+"

  resource "apidocs" do
    url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.5.0/commandbox-apidocs-3.5.0.zip"
    sha256 "32b86a55b89a58bb732a1630c290f99e6ae53e97eef808cf99b207a70cc0c1d9"
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
