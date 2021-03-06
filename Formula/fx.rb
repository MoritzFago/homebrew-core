require "language/node"

class Fx < Formula
  desc "Command-line JSON processing tool"
  homepage "https://github.com/antonmedv/fx"
  url "https://registry.npmjs.org/fx/-/fx-8.0.0.tgz"
  sha256 "e0080e6e9b6886854b86d5b0001024d6d0b30d9a81cdacf6578d9965ee389db0"

  bottle do
    cellar :any_skip_relocation
    sha256 "f110f140b68193c5c78f8bb72b6a01d64afc86fcd9f414488f98374c6afb438b" => :mojave
    sha256 "f865ee991d814cba36d9ce5a03baf965ea7ab59ff464e7ef622866d5a794db64" => :high_sierra
    sha256 "18ba53edc095805c9362129dbfee9bfaec65e45726bb7650be13e4dc1eb4efca" => :sierra
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "bar", shell_output("echo '{\"foo\": \"bar\"}' #{bin}/fx .foo")
  end
end
