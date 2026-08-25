class GitA2a < Formula
  desc "Import git modules together with their owning agents"
  homepage "https://github.com/neprel/git-a2a"
  version "1.7.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neprel/git-a2a/releases/download/v1.7.1/git-a2a_brew_1.7.1_darwin_arm64.tar.gz"
      sha256 "70aab85dccacbb3bf9a9a10c531724acd6e2b5d626d8c1c418fab2ecb1c9aedb"
    else
      url "https://github.com/neprel/git-a2a/releases/download/v1.7.1/git-a2a_brew_1.7.1_darwin_amd64.tar.gz"
      sha256 "32447f622d54f1675a5862c7de312b0ca6350be483b742ecf299ef1479bac817"
    end
  end

  def install
    bin.install "git-a2a"
    system "/bin/sh", "-c", 'if /usr/bin/xattr -p com.apple.quarantine "$1" >/dev/null 2>&1; then exec /usr/bin/xattr -d com.apple.quarantine "$1"; fi', "git-a2a", bin/"git-a2a"
  end

  test do
    assert_match "git-a2a 1.7.1", shell_output("#{bin}/git-a2a --version")
  end
end
