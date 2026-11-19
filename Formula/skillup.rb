class Skillup < Formula
  desc "Inspect and update installed AI agent skills"
  homepage "https://github.com/M1chlCZ/skill-updater"
  url "https://github.com/M1chlCZ/skill-updater/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "95e7006b4f57eb105a9a31b265fa1a3b04612a0c12966a62c2d09f09e38bd777"
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
