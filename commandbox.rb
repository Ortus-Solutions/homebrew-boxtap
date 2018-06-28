class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.1.0/commandbox-bin-4.1.0.zip"
  sha256 "b67317451253d239a225cea158cbc12aedef3e5bf94580503cfa2503f136266b"

  devel do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.1.1-alpha/commandbox-bin-4.1.1-alpha.zip?build=01036"
    sha256 "10b25188307f70eeed673a26d8afa3eb29bd63dbcd29a7897f95ead5eb531650"
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
