class GitA2a < Formula
  desc "Import git modules together with their owning agents"
  homepage "https://github.com/neprel/git-a2a"
  version "1.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neprel/git-a2a/releases/download/v1.5.0/git-a2a_brew_1.5.0_darwin_arm64.tar.gz"
      sha256 "8e440131131048b4c9879e2a5c16dbaf7e2dddce815db21ed042fd04628404e1"
    else
      url "https://github.com/neprel/git-a2a/releases/download/v1.5.0/git-a2a_brew_1.5.0_darwin_amd64.tar.gz"
      sha256 "045b858045088098d37d64c84d21a5b105461227ce04215d1cc044ec70d21454"
    end
  end

  def install
    bin.install "git-a2a"
    system "/bin/sh", "-c", 'if /usr/bin/xattr -p com.apple.quarantine "$1" >/dev/null 2>&1; then exec /usr/bin/xattr -d com.apple.quarantine "$1"; fi', "git-a2a", bin/"git-a2a"
  end

  test do
    assert_match "git-a2a 1.5.0", shell_output("#{bin}/git-a2a --version")
  end
end
