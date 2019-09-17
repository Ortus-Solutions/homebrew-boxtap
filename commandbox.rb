class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.8.0/commandbox-bin-4.8.0.zip"
  sha256 "188b994e023d96ff4dd2a2b497dce96cccf4b5d849e47505b6104d79b834f143"

  devel do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.8.0/commandbox-bin-4.8.0.zip?build=00057"
    sha256 "188b994e023d96ff4dd2a2b497dce96cccf4b5d849e47505b6104d79b834f143"
  end

  bottle :unneeded

  depends_on :java => "1.8"

  resource "apidocs" do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.8.0/commandbox-apidocs-4.8.0.zip"
    sha256 "5b5cf42b7ba18ec7ef279b0ab4fd8e4d8bad2e4a199798e899ab2e81f5e67ca4"
  end

  def install
    libexec.install "box"
    (bin/"box").write_env_script libexec/"box", Language::Java.java_home_env("1.8")
    doc.install resource("apidocs")
  end

  test do
    system "#{bin}/box", "--commandbox_home=~/", "version"
    system "#{bin}/box", "--commandbox_home=~/", "help"
  end
end
