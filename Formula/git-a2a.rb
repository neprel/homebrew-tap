class GitA2a < Formula
  desc "Import git modules together with their owning agents"
  homepage "https://github.com/neprel/git-a2a"
  version "1.2.0-rc.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neprel/git-a2a/releases/download/v1.2.0-rc.2/git-a2a_brew_1.2.0-rc.2_darwin_arm64.tar.gz"
      sha256 "6e96d8b6c8545981b33f20ccfd8c7bf35cc139dbfd7bffc2278ade05f11e611b"
    else
      url "https://github.com/neprel/git-a2a/releases/download/v1.2.0-rc.2/git-a2a_brew_1.2.0-rc.2_darwin_amd64.tar.gz"
      sha256 "382383f453ee98eb3a56ae45d793d16aae2e57bd0884a09ab6cc6cfc05f033bf"
    end
  end

  def install
    bin.install "git-a2a"
    system "/bin/sh", "-c", 'if /usr/bin/xattr -p com.apple.quarantine "$1" >/dev/null 2>&1; then exec /usr/bin/xattr -d com.apple.quarantine "$1"; fi', "git-a2a", bin/"git-a2a"
  end

  test do
    assert_match "git-a2a 1.2.0", shell_output("#{bin}/git-a2a --version")
  end
end
