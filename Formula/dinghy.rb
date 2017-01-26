class Dinghy < Formula
  desc "faster, friendlier Docker on OS X"
  homepage "https://github.com/codekitchen/dinghy"
  url "https://github.com/paolomainardi/dinghy.git", :tag => "v4.4.3-fork-2", :revision => "a18d9911eef7a7021ead05f5fee004203759baa2"
  head "https://github.com/paolomainardi/dinghy.git", :branch => :master

  depends_on "homebrew/boneyard/unfs3"

  def install
    if head?
      inreplace "cli/dinghy/version.rb", /DINGHY_VERSION=.*/, "DINGHY_VERSION='#{version}'"
    end
    bin.install "bin/dinghy"
    bin.install "bin/_dinghy_command"
    prefix.install "cli"
  end

  def caveats; <<-EOS.undent
    Run `dinghy create` to create the VM, then `dinghy up` to bring up the VM and services.
    EOS
  end

  test do
    system "dinghy", "version"
  end
end
