class GitA2a < Formula
  desc "Import git modules together with their owning agents"
  homepage "https://github.com/neprel/git-a2a"
  version "1.3.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neprel/git-a2a/releases/download/v1.3.1/git-a2a_brew_1.3.1_darwin_arm64.tar.gz"
      sha256 "cbfac150e15cf35cacabe9525707531a27c6246b04b7af3924b67fd571841977"
    else
      url "https://github.com/neprel/git-a2a/releases/download/v1.3.1/git-a2a_brew_1.3.1_darwin_amd64.tar.gz"
      sha256 "028aa31ab8c391626e80c77d55c4eb448883105ffadbeab00af5eca01474f543"
    end
  end

  def install
    bin.install "git-a2a"
    system "/bin/sh", "-c", 'if /usr/bin/xattr -p com.apple.quarantine "$1" >/dev/null 2>&1; then exec /usr/bin/xattr -d com.apple.quarantine "$1"; fi', "git-a2a", bin/"git-a2a"
  end

  test do
    assert_match "git-a2a 1.3.1", shell_output("#{bin}/git-a2a --version")
  end
end
