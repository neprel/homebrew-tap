class GitA2a < Formula
  desc "Manage Git component dependencies with their responsible agents"
  homepage "https://github.com/neprel/git-a2a"
  version "2.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neprel/git-a2a/releases/download/v2.1.1/git-a2a_brew_2.1.1_darwin_arm64.tar.gz"
      sha256 "1c1ce25aff6b3d793bbde0eaf7b6de4b166f8dd723b337809f4da36c9b0c2fd1"
    else
      url "https://github.com/neprel/git-a2a/releases/download/v2.1.1/git-a2a_brew_2.1.1_darwin_amd64.tar.gz"
      sha256 "24ae433f6de50305152b820bfc9bfd96f51f0a7f717d5c4ae61dd4c95044cf20"
    end
  end

  def install
    bin.install "git-a2a"
    system "/bin/sh", "-c", 'if /usr/bin/xattr -p com.apple.quarantine "$1" >/dev/null 2>&1; then exec /usr/bin/xattr -d com.apple.quarantine "$1"; fi', "git-a2a", bin/"git-a2a"
  end

  test do
    assert_match "git-a2a 2.1.1", shell_output("#{bin}/git-a2a --version")
  end
end
