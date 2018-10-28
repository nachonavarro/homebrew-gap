class Gap < Formula
  desc "GAP - Groups, Algorithms, Programming - a System for Computational Discrete Algebra"
  homepage "https://www.gap-system.org/"
  url "https://github.com/gap-system/gap/archive/v4.9.3.tar.gz"
  sha256 "f07e99b37391c9a1fdbe76721327e30b698e4835d088131615a1f6a5cebdf7e0"
  version "4.9.3"

  depends_on "autoconf" => :build
  depends_on "libtool" => :build
  depends_on "wget" => :build
  depends_on "gmp"
  depends_on "readline"

  def install
    system "./autogen.sh"
    system "./configure", "--with-readline=/usr/local/opt/readline", "--prefix=#{prefix}"
    inreplace "bin/gap.sh" do |s|
      s.gsub! /GAP_DIR=\$\(cd "(.*)"/, "GAP_DIR=$(cd \"#{libexec}\""
      s.gsub! /GAP_EXE=.*/, "GAP_EXE=#{libexec}"
    end
    system "make", "-j4"
    system "make", "bootstrap-pkg-full"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"gap"
  end
end
