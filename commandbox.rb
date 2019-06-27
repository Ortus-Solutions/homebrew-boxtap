class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.7.0/commandbox-bin-4.7.0.zip"
  sha256 "7dffd19691af86aa0d852521b7ed7ad77b7bff7a86a86ae248a0c65a5ab2ab71"

  devel do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.8.0-alpha/commandbox-bin-4.8.0-alpha.zip?build=00033"
    sha256 "d0cfd074ac4a9cbe5a5c2d9539ff41a39142f32c764b48ce7eab48855ad00478"
  end

  bottle :unneeded

  depends_on :java => "1.8"

  resource "apidocs" do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.7.0/commandbox-apidocs-4.7.0.zip"
    sha256 "a516770daab869da625aec5da2e22e0061109f7b8263f6583efd089dba8fda4c"
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
