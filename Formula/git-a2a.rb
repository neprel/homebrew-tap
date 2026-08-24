class GitA2a < Formula
  desc "Import git modules together with their owning agents"
  homepage "https://github.com/neprel/git-a2a"
  version "1.3.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neprel/git-a2a/releases/download/v1.3.2/git-a2a_brew_1.3.2_darwin_arm64.tar.gz"
      sha256 "5250190138d56ead26cfd15ca857d5ababa8d15cee6dbe7393889d818368bb1f"
    else
      url "https://github.com/neprel/git-a2a/releases/download/v1.3.2/git-a2a_brew_1.3.2_darwin_amd64.tar.gz"
      sha256 "8e625d2994f1617bde51767169a2984bcdece6da0a9ca2efdf8e3bbe9e105dd8"
    end
  end

  def install
    bin.install "git-a2a"
    system "/bin/sh", "-c", 'if /usr/bin/xattr -p com.apple.quarantine "$1" >/dev/null 2>&1; then exec /usr/bin/xattr -d com.apple.quarantine "$1"; fi', "git-a2a", bin/"git-a2a"
  end

  test do
    assert_match "git-a2a 1.3.2", shell_output("#{bin}/git-a2a --version")
  end
end
