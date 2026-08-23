class GitA2a < Formula
  desc "Import git modules together with their owning agents"
  homepage "https://github.com/neprel/git-a2a"
  version "1.0.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neprel/git-a2a/releases/download/v1.0.1/git-a2a_brew_1.0.1_darwin_arm64.tar.gz"
      sha256 "761a29e0cfb278fea14a55894ec687588c53b8573ec02eb98850305d10a8ccb4"
    else
      url "https://github.com/neprel/git-a2a/releases/download/v1.0.1/git-a2a_brew_1.0.1_darwin_amd64.tar.gz"
      sha256 "5d3f23439e459e80b18316d1d311dce1b2f88fe3d0122656205b04d959fd2332"
    end
  end

  def install
    bin.install "git-a2a"
    system "/bin/sh", "-c", 'if /usr/bin/xattr -p com.apple.quarantine "$1" >/dev/null 2>&1; then exec /usr/bin/xattr -d com.apple.quarantine "$1"; fi', "git-a2a", bin/"git-a2a"
  end

  test do
    assert_match "git-a2a 1.0.1", shell_output("#{bin}/git-a2a --version")
  end
end
