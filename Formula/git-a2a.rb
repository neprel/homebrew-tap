class GitA2a < Formula
  desc "Manage Git component dependencies with their responsible agents"
  homepage "https://github.com/neprel/git-a2a"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neprel/git-a2a/releases/download/v2.0.0/git-a2a_brew_2.0.0_darwin_arm64.tar.gz"
      sha256 "f4bfdfda798f6f438e6ba13bd56f94bd9c9b49ce5ef5b98c3f8d98b85f9b72d7"
    else
      url "https://github.com/neprel/git-a2a/releases/download/v2.0.0/git-a2a_brew_2.0.0_darwin_amd64.tar.gz"
      sha256 "4e29e0478d31ce32ab6097fd0db9432d429e68b16c5d481e3c936b673ed008b7"
    end
  end

  def install
    bin.install "git-a2a"
    system "/bin/sh", "-c", 'if /usr/bin/xattr -p com.apple.quarantine "$1" >/dev/null 2>&1; then exec /usr/bin/xattr -d com.apple.quarantine "$1"; fi', "git-a2a", bin/"git-a2a"
  end

  test do
    assert_match "git-a2a 2.0.0", shell_output("#{bin}/git-a2a --version")
  end
end
