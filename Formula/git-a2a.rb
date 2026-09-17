class GitA2a < Formula
  desc "Manage Git component dependencies with their responsible agents"
  homepage "https://github.com/neprel/git-a2a"
  version "2.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neprel/git-a2a/releases/download/v2.1.0/git-a2a_brew_2.1.0_darwin_arm64.tar.gz"
      sha256 "48840ea02e60ac79079d84b2e18a23aecedde74d75194a6de8f322c951eacac0"
    else
      url "https://github.com/neprel/git-a2a/releases/download/v2.1.0/git-a2a_brew_2.1.0_darwin_amd64.tar.gz"
      sha256 "a5ce819b9d1fbcd1c7b0856cbad84d2ad5c045678fbb6da54a2801a9bb2a0a3d"
    end
  end

  def install
    bin.install "git-a2a"
    system "/bin/sh", "-c", 'if /usr/bin/xattr -p com.apple.quarantine "$1" >/dev/null 2>&1; then exec /usr/bin/xattr -d com.apple.quarantine "$1"; fi', "git-a2a", bin/"git-a2a"
  end

  test do
    assert_match "git-a2a 2.1.0", shell_output("#{bin}/git-a2a --version")
  end
end
