class GitA2a < Formula
  desc "Import git modules together with their owning agents"
  homepage "https://github.com/neprel/git-a2a"
  version "1.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neprel/git-a2a/releases/download/v1.7.0/git-a2a_brew_1.7.0_darwin_arm64.tar.gz"
      sha256 "d0ea50eb6f52c191baccd3b914059a0e6f1ef98f80a39d0463870c1fd6d871bb"
    else
      url "https://github.com/neprel/git-a2a/releases/download/v1.7.0/git-a2a_brew_1.7.0_darwin_amd64.tar.gz"
      sha256 "66124029520db6e6b1c96562a67d0d25592349a3ab30f98b5854404219853ecb"
    end
  end

  def install
    bin.install "git-a2a"
    system "/bin/sh", "-c", 'if /usr/bin/xattr -p com.apple.quarantine "$1" >/dev/null 2>&1; then exec /usr/bin/xattr -d com.apple.quarantine "$1"; fi', "git-a2a", bin/"git-a2a"
  end

  test do
    assert_match "git-a2a 1.7.0", shell_output("#{bin}/git-a2a --version")
  end
end
