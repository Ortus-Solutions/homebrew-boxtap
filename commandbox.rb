class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.6.1/commandbox-bin-5.6.1.zip"
  sha256 "4a9ea32cf310b131b1c7982991bb1aac2cc841c01e2602a7eb2f02140a350d85"
  license "LGPL-3.0-or-later"

  head do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.7.0-alpha/commandbox-bin-5.7.0-alpha.zip?build=00649"
    sha256 "e85db4ac5aacebc3e1eca9fa1930e2b84494fdf410b0cf9718ea1a89863d5f33"
  end

  livecheck do
    url :homepage
    regex(/Download CommandBox v?(\d+(?:\.\d+)+)/i)
  end

  bottle do
    sha256 cellar: :any_skip_relocation, all: "45b01d0263bf8842d6b060ed23202a77ab6b33d2a3c1c2a89be80eb4c50324ba"
  end

  # not yet compatible with Java 17 on ARM
  depends_on "openjdk@11"

  resource "apidocs" do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.6.1/commandbox-apidocs-5.6.1.zip"
    sha256 "516086b4e03fdb8b39e90754f5f201dd9fa9f67c0810900803340ff7540f4f0c"
  end

  def install
    (libexec/"bin").install "box"
    (bin/"box").write_env_script libexec/"bin/box", Language::Java.java_home_env("11")
    doc.install resource("apidocs")
  end

  test do
    system "#{bin}/box", "--commandbox_home=~/", "version"
    system "#{bin}/box", "--commandbox_home=~/", "help"
  end
end
