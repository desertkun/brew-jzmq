require 'formula'

class Jzmq < Formula
  homepage 'https://github.com/zeromq/jzmq'
  url 'git://github.com/zeromq/jzmq.git'
  version '2.1.0'
  sha1 ''

  depends_on 'zeromq'
  depends_on 'pkg-config'
  depends_on 'autoconf'
  depends_on 'automake'
  depends_on 'libtool'

  def install
    # ENV.j1  # if your formula's build system can't parallelize
    system "./autogen.sh"

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"

    # org/zeromq/ZMQ.java must be built before run `make`
#    system "cd src && CLASSPATH=.:./.:$CLASSPATH /usr/bin/javac -d . org/zeromq/ZMQ.java"
    system "make"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test jzmq`.
    system "false"
  end
  def caveats; <<-EOS.undent
      Jar file is installed in /usr/local/share/java/zmq.jar
    EOS
  end
end

#  def install
#    # Place pkg.m4
#    mkdir "config/"
#    cp "/usr/local/share/aclocal/pkg.m4", "config/"
#
#
#    # Set JAVA_HOME
#    ENV["JAVA_HOME"] = "/Library/Java/Home/" unless ENV["JAVA_HOME"]
