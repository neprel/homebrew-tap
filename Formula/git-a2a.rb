class GitA2a < Formula
  desc "Import git modules together with their owning agents"
  homepage "https://github.com/neprel/git-a2a"
  version "1.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neprel/git-a2a/releases/download/v1.3.0/git-a2a_brew_1.3.0_darwin_arm64.tar.gz"
      sha256 "254d654dd6dc2bce2cb3133651c5394bb93e311439563c7fbe1ddec9c4363e46"
    else
      url "https://github.com/neprel/git-a2a/releases/download/v1.3.0/git-a2a_brew_1.3.0_darwin_amd64.tar.gz"
      sha256 "b6a4525e8d978c1e66018163bb00aef4b2890516f8cf658c95c46ff471faed42"
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
