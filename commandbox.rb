class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.9.0/commandbox-bin-3.9.0.zip"
  sha256 "9497a7db8879150548b05d28594cc7d316556fc3a2e4602d3795b589ba85105e"

  devel do
    url "http://integration.stg.ortussolutions.com/artifacts/ortussolutions/commandbox/3.9.1-snapshot/commandbox-bin-3.9.1-snapshot.zip?build=00822"
    sha256 "bd2189166e689bf62b9b3961cd06664802188536660155b8f39c60accdc1eedb"
  end

  bottle :unneeded

  depends_on :java => "1.7+"

  resource "apidocs" do
    url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.9.0/commandbox-apidocs-3.9.0.zip"
    sha256 "ffdbc521837f963d73295bf2ed8ecf55edfb20aa817ea95da89fc375a575f23c"
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
