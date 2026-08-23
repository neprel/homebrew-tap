class GitA2a < Formula
  desc "Import git modules together with their owning agents"
  homepage "https://github.com/neprel/git-a2a"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neprel/git-a2a/releases/download/v1.0.0/git-a2a_brew_1.0.0_darwin_arm64.tar.gz"
      sha256 "3621a31034e0980ea7101f423964e30ae5086a787e804f89f86ebb013c9dc1ee"
    else
      url "https://github.com/neprel/git-a2a/releases/download/v1.0.0/git-a2a_brew_1.0.0_darwin_amd64.tar.gz"
      sha256 "44bd7089f313b0e7cc5370f395f989f74b3f8bc214f17582d54efbb5e0fe72ad"
    end
  end

  def install
    bin.install "git-a2a"
  end

  test do
    assert_match "git-a2a 1.0.0", shell_output("#{bin}/git-a2a --version")
  end
end
