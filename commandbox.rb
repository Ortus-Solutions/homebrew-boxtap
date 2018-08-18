class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.2.0/commandbox-bin-4.2.0.zip"
  sha256 "9d872fa9600fb9188f12626945fda0957fd02c390b5974996735fd5f03ef34fc"

  devel do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.2.1-alpha/commandbox-bin-4.2.1-alpha.zip?build=00074"
    sha256 "06f08f013d5360f147ee92d829f1da9a76782fbc4f9516589b88be4d8e51e734"
  end

  bottle :unneeded

  depends_on :java => "1.8"

  resource "apidocs" do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.2.0/commandbox-apidocs-4.2.0.zip"
    sha256 "3007d748baa867a97ac22f2ca2c11adaf081060c48fb365defb8912aee37e014"
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
