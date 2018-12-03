class Ecdsautils < Formula
  desc "Tiny collection of programs used for ECDSA (keygen, sign, verify)"
  homepage "https://wiki.freifunk.net/ECDSA_Util"
  url "https://github.com/MoritzFago/ecdsautils/archive/v0.4.0.tar.gz"
  sha256 "9a2eb186701e8ede94f0afc83947694d4f01b0bec4f7860f0ceab2dfb31a00fe"
  head "git://github.com/MoritzFago/ecdsautils.git"
  depends_on "cmake" => :build
  depends_on "libuecc"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    system "#{bin}/ecdsautil", "generate-key"
  end
end
