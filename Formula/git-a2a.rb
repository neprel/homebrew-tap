class GitA2a < Formula
  desc "Import git modules together with their owning agents"
  homepage "https://github.com/neprel/git-a2a"
  version "1.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neprel/git-a2a/releases/download/v1.1.0/git-a2a_brew_1.1.0_darwin_arm64.tar.gz"
      sha256 "5f596aeb922c3ecdc332c88eb3a26a05eb1154be6e037f340ae1fb6abe287737"
    else
      url "https://github.com/neprel/git-a2a/releases/download/v1.1.0/git-a2a_brew_1.1.0_darwin_amd64.tar.gz"
      sha256 "54d210154c9496deb9964749e663e84dc34b2c4ecf727e84947247a6c85e3a46"
    end
  end

  def install
    bin.install "git-a2a"
    system "/bin/sh", "-c", 'if /usr/bin/xattr -p com.apple.quarantine "$1" >/dev/null 2>&1; then exec /usr/bin/xattr -d com.apple.quarantine "$1"; fi', "git-a2a", bin/"git-a2a"
  end

  test do
    assert_match "git-a2a 1.1.0", shell_output("#{bin}/git-a2a --version")
  end
end
