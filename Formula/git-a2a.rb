class GitA2a < Formula
  desc "Import git modules together with their owning agents"
  homepage "https://github.com/neprel/git-a2a"
  version "1.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neprel/git-a2a/releases/download/v1.2.0/git-a2a_brew_1.2.0_darwin_arm64.tar.gz"
      sha256 "3e493669057e78eaa3898e8837c564f4cbbc011e0c347474b30274b0def70c78"
    else
      url "https://github.com/neprel/git-a2a/releases/download/v1.2.0/git-a2a_brew_1.2.0_darwin_amd64.tar.gz"
      sha256 "ea9b94b2f7bb10d3ee2623e0c15a199425364d8e8122e17f60faa5bc76f9a28f"
    end
  end

  def install
    bin.install "git-a2a"
    system "/bin/sh", "-c", 'if /usr/bin/xattr -p com.apple.quarantine "$1" >/dev/null 2>&1; then exec /usr/bin/xattr -d com.apple.quarantine "$1"; fi', "git-a2a", bin/"git-a2a"
  end

  test do
    assert_match "git-a2a 1.2.0", shell_output("#{bin}/git-a2a --version")
  end
end
