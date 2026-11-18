class Skillup < Formula
  desc "Inspect and update installed AI agent skills"
  homepage "https://github.com/M1chlCZ/skill-updater"
  url "https://github.com/M1chlCZ/skill-updater/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f3a2d3ee9b5776a36fe233d372133c261423f38df133dd34ab10324d2caa7949"
  license "MIT"

  depends_on "go" => :build
  uses_from_macos "git"

  deny_network_access!

  def fetch
    system "go", "mod", "download"
  end

  def install
    system "go", "build", *std_go_args, "./cmd/skillup"
  end

  test do
    assert_match "Usage: skillup", shell_output("#{bin}/skillup --help 2>&1")
  end
end
