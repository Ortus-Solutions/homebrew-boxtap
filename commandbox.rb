class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.2.0/commandbox-bin-3.2.0.zip"
  sha256 "42b0be0f5bcfdae161e24a587c98f8a21550ad76f23303cfb7f06eed03cbd8c5"
  version "3.2.0"

  devel do
    url "http://integration.stg.ortussolutions.com/artifacts/ortussolutions/commandbox/3.2.1-snapshot/commandbox-bin-3.2.1-snapshot.zip?build=00429"
    sha256 "26ba7ed95a26ab9470ee512c6ad7133ee9c693cdaab34f731ae07d8298ea6cb9"
    version "3.2.1-snapshot"
  end

  bottle :unneeded

  depends_on :java => "1.7+"

  resource "apidocs" do
    url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.2.0/commandbox-apidocs-3.2.0.zip"
    sha256 "7444852e09d10f04cd087ade4e4962e4abb0b0a8a1e0b63beba971bf2c563a3c"
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
