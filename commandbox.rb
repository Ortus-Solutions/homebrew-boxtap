class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.9.2/commandbox-bin-3.9.2.zip"
  sha256 "4a37876759c76ec5c38ccaa77789bb22ba434b8b04cd3ed26a79fbd638dca050"

  devel do
    url "http://integration.stg.ortussolutions.com/artifacts/ortussolutions/commandbox/4.0.0-SNAPSHOT/commandbox-bin-4.0.0-SNAPSHOT.zip?build=00863"
    sha256 "434db48f11ec37d73f5579f2bebf4fb2fc1022cacf92f9420ed3e1b2ae71ba2b"
  end

  bottle :unneeded

  depends_on :java => "1.7+"

  resource "apidocs" do
    url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.9.2/commandbox-apidocs-3.9.2.zip"
    sha256 "6902e887e162207339f86ee2bd350285fd7149e260c78b448031c22910a71205"
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
