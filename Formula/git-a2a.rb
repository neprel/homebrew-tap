class GitA2a < Formula
  desc "Import git modules together with their owning agents"
  homepage "https://github.com/neprel/git-a2a"
  version "1.3.0-rc.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neprel/git-a2a/releases/download/v1.3.0-rc.2/git-a2a_brew_1.3.0-rc.2_darwin_arm64.tar.gz"
      sha256 "53844d73636923c6e36589270fb2fb90d00479e1e7bfa99b418ea8ac266bd6ee"
    else
      url "https://github.com/neprel/git-a2a/releases/download/v1.3.0-rc.2/git-a2a_brew_1.3.0-rc.2_darwin_amd64.tar.gz"
      sha256 "43bb26009283f81a7f69f90a65f8c01ec4afcb60024586a141cac03ad97a7a72"
    end
  end

  def install
    bin.install "git-a2a"
    system "/bin/sh", "-c", 'if /usr/bin/xattr -p com.apple.quarantine "$1" >/dev/null 2>&1; then exec /usr/bin/xattr -d com.apple.quarantine "$1"; fi', "git-a2a", bin/"git-a2a"
  end

  test do
    assert_match "git-a2a 1.3.0", shell_output("#{bin}/git-a2a --version")
  end
end
