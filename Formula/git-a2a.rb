class GitA2a < Formula
  desc "Import git modules together with their owning agents"
  homepage "https://github.com/neprel/git-a2a"
  version "1.3.0-rc.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neprel/git-a2a/releases/download/v1.3.0-rc.1/git-a2a_brew_1.3.0-rc.1_darwin_arm64.tar.gz"
      sha256 "20f68a10705b69f516098499d71cfd0957995bc4c8a208a497f05fb53486f6ad"
    else
      url "https://github.com/neprel/git-a2a/releases/download/v1.3.0-rc.1/git-a2a_brew_1.3.0-rc.1_darwin_amd64.tar.gz"
      sha256 "5db67ac2b3ff4a4b0ff10178f854f63008d9caac28a7f99740cc7c100ce6b7a3"
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
