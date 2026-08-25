class GitA2a < Formula
  desc "Import git modules together with their owning agents"
  homepage "https://github.com/neprel/git-a2a"
  version "1.6.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neprel/git-a2a/releases/download/v1.6.0/git-a2a_brew_1.6.0_darwin_arm64.tar.gz"
      sha256 "d634f8ebc2cd67447b10de2524b8d887650cbb71a7bf02854f28d4ff9e8db56e"
    else
      url "https://github.com/neprel/git-a2a/releases/download/v1.6.0/git-a2a_brew_1.6.0_darwin_amd64.tar.gz"
      sha256 "aaba5093f37bb048ead6cc6a51440a13c3c18f0494913340816913a23ba4886b"
    end
  end

  def install
    bin.install "git-a2a"
    system "/bin/sh", "-c", 'if /usr/bin/xattr -p com.apple.quarantine "$1" >/dev/null 2>&1; then exec /usr/bin/xattr -d com.apple.quarantine "$1"; fi', "git-a2a", bin/"git-a2a"
  end

  test do
    assert_match "git-a2a 1.6.0", shell_output("#{bin}/git-a2a --version")
  end
end
