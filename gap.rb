class Gap < Formula
  desc "GAP - Groups, Algorithms, Programming - a System for Computational Discrete Algebra"
  homepage "https://www.gap-system.org/"
  url "https://github.com/gap-system/gap/archive/v4.9.3.tar.gz"
  sha256 "f07e99b37391c9a1fdbe76721327e30b698e4835d088131615a1f6a5cebdf7e0"
  version "4.9.3"

  depends_on "autoconf"
  depends_on "libtool"
  depends_on "gmp"
  depends_on "readline"

  def install
    system "./autogen.sh"
    mkdir "headers"
    system "./configure", "--with-readline=/usr/local/opt/readline", "--includedir=#{buildpath}/headers"
    system "make", "install"
  end
end
