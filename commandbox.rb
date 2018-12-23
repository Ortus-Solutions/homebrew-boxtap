class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.5.0/commandbox-bin-4.5.0.zip"
  sha256 "555e6e121ec1ab05bf28d3416ea51199ca60c1eefa4128510315c926b606a1d9"

  devel do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.5.0/commandbox-bin-4.5.0.zip?build=00197"
    sha256 "555e6e121ec1ab05bf28d3416ea51199ca60c1eefa4128510315c926b606a1d9"
  end

  bottle :unneeded

  depends_on :java => "1.8"

  resource "apidocs" do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.5.0/commandbox-apidocs-4.5.0.zip"
    sha256 "7edad163d6761ff04b1280e082fe1e419c89d85bff524a4cb0a9c726bbf3cbc7"
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
