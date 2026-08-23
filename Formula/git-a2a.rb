class GitA2a < Formula
  desc "Import git modules together with their owning agents"
  homepage "https://github.com/neprel/git-a2a"
  version "1.1.0-rc.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neprel/git-a2a/releases/download/v1.1.0-rc.2/git-a2a_brew_1.1.0-rc.2_darwin_arm64.tar.gz"
      sha256 "f9f80626950f347c586c1f495ccacc78840b01bacb98686075f4c02ad928aac3"
    else
      url "https://github.com/neprel/git-a2a/releases/download/v1.1.0-rc.2/git-a2a_brew_1.1.0-rc.2_darwin_amd64.tar.gz"
      sha256 "d1b792371c72e622c6d99a6eb4852f2e43bd9329c9224451d99bd09e8cbcad9c"
    end
  end

  def install
    bin.install "git-a2a"
    system "/bin/sh", "-c", 'if /usr/bin/xattr -p com.apple.quarantine "$1" >/dev/null 2>&1; then exec /usr/bin/xattr -d com.apple.quarantine "$1"; fi', "git-a2a", bin/"git-a2a"
  end

  test do
    assert_match "git-a2a 1.1.0-rc.2", shell_output("#{bin}/git-a2a --version")
  end
end
