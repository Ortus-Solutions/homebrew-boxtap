class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.0.0/commandbox-bin-4.0.0.zip"
  sha256 "f8b1eaa71faa4d918d778c831b244d0606dff77a075d4aca124c458fdcccd429"

  devel do
    url "http://integration.stg.ortussolutions.com/artifacts/ortussolutions/commandbox/4.0.1-alpha/commandbox-bin-4.0.1-alpha.zip?build=00018"
    sha256 "a024e026477f66ebba6f2d2d21e974addaab4bbdf48e1a99b7b85e76fb01a4ea"
  end

  bottle :unneeded

  depends_on :java => "1.8"

  resource "apidocs" do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.0.0/commandbox-apidocs-4.0.0.zip"
    sha256 "b3e3ae2d98aa8ab029b0f6ee3ba130463be50fa7ee99905bc4163c7c5acc9a9a"
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
