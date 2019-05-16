class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.6.0/commandbox-bin-4.6.0.zip"
  sha256 "135abf4dc4757226a24929536f209ae26e36c0bdc680429331c356761fc7dfcd"

  devel do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.7.0-alpha/commandbox-bin-4.7.0-alpha.zip?build=00016"
    sha256 "0ddea2ba8875a85e99e61b9d27420d4ef252ca4d3e05fdce0d4c1d6fd6f818c8"
  end

  bottle :unneeded

  depends_on :java => "1.8"

  resource "apidocs" do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.6.0/commandbox-apidocs-4.6.0.zip"
    sha256 "c97ca12447607d424345d2ff0eea0d41b14bec16e8e35dcd5c62905181e0c3c8"
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
