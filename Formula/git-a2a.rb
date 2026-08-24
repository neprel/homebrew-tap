class GitA2a < Formula
  desc "Import git modules together with their owning agents"
  homepage "https://github.com/neprel/git-a2a"
  version "1.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neprel/git-a2a/releases/download/v1.4.0/git-a2a_brew_1.4.0_darwin_arm64.tar.gz"
      sha256 "3ed0d9b5e223b45aed78025d2fa719f0caf629687ee8e7ef3fd02b855553c138"
    else
      url "https://github.com/neprel/git-a2a/releases/download/v1.4.0/git-a2a_brew_1.4.0_darwin_amd64.tar.gz"
      sha256 "29c78751bc0f9f06b476405de9031022faba721a6a22f6e895448caf2d3ecc0a"
    end
  end

  def install
    bin.install "git-a2a"
    system "/bin/sh", "-c", 'if /usr/bin/xattr -p com.apple.quarantine "$1" >/dev/null 2>&1; then exec /usr/bin/xattr -d com.apple.quarantine "$1"; fi', "git-a2a", bin/"git-a2a"
  end

  test do
    assert_match "git-a2a 1.4.0", shell_output("#{bin}/git-a2a --version")
  end
end
