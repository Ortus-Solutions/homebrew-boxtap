class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.3.0/commandbox-bin-4.3.0.zip"
  sha256 "ca39ddaa354c2914238b37fc6ca78cafb1e1cd247f5c5893b2782d250b169f1b"

  devel do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.4.0-alpha/commandbox-bin-4.4.0-alpha.zip?build=00123"
    sha256 "a483633a9c8f0f72ceb8259493f6ed4281b528ffb4e1cafee3a4b6a3b689daf0"
  end

  bottle :unneeded

  depends_on :java => "1.8"

  resource "apidocs" do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.3.0/commandbox-apidocs-4.3.0.zip"
    sha256 "0c2325134cf2f0fc168e7cf0f44524f32ac7bfdd41a2b350ef912548f1751755"
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
