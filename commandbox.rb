class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.1.0/commandbox-bin-4.1.0.zip"
  sha256 "a17d21431d62bf45ba4d712bc310f7acf4644cc25609934bf13b65e1bb1f2132"

  devel do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.1.1-alpha/commandbox-bin-4.1.1-alpha.zip?build=00067"
    sha256 "150fe100ee85b1d1de87527d3e3f0b3fae6ae96b297921426405354987e17881"
  end

  bottle :unneeded

  depends_on :java => "1.8"

  resource "apidocs" do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.1.0/commandbox-apidocs-4.1.0.zip"
    sha256 "ababed851aba087de3abc532ae999c48e155af74a933ff2223171ed59a3201a3"
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
