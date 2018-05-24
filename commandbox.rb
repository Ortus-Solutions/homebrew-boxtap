class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.0.0/commandbox-bin-4.0.0.zip"
  sha256 "d9f7641ba2dd7c3fa6b55f43159e0765c51e9e519f9be0c82563cba2c4d07218"

  devel do
    url "http://integration.stg.ortussolutions.com/artifacts/ortussolutions/commandbox/4.0.1-alpha/commandbox-bin-4.0.1-alpha.zip?build=01016"
    sha256 "4bff6e35ad0e4653f4be5bc925432beeae5082dfefe5fc734dcd10c27492c293"
  end

  bottle :unneeded

  depends_on :java => "1.8"

  resource "apidocs" do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.0.0/commandbox-apidocs-4.0.0.zip"
    sha256 "21945ef8aca4c9fb4f221e4e467425e08dddaba64ef6776d36e403fcd05e8e2e"
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
