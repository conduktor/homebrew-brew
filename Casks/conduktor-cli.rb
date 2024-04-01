cask "conduktor-cli" do
  version "0.1.0"
  url "https://github.com/conduktor/ctl/releases/download/#{version}/conduktor-#{version}-darwin-amd64.tar.gz", verified: "https://github.com/conduktor"
  sha256 "ea1f33a0c09672143c443e19fef7c85b2217ca70623ab72754a118cb8bb5be21"

  name "Conduktor CLI"
  desc "Interact with Conduktor with a CLI to perform some operations directly from your command line or a CI/CD pipeline."
  homepage "https://www.conduktor.io/"

  binary "conduktor"
end

class Conduktorctl < Formula
  name "Conduktor CLI"
  version "0.1.0"
  sha256 "d76471829c0c6493faf0a1f4d7baac85d8da61fc0254cdaf80c76b8bfa76d8f0"
  desc "Conduktor CLI performs operations from your terminal or a CI/CD pipeline"
  homepage "https://www.conduktor.io/"
  url "https://github.com/conduktor/ctl/archive/refs/tags/#{version}.tar.gz", verified: "https://github.com/conduktor"
  license "Apache-2.0"
  head "https://github.com/conduktor/ctl.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"conduktor")
  end

  test do
    assert_predicate bin/"conduktor", :exist?
    output = `#{bin}/conduktor 2>&1`
    
    assert_match "Please set CDK_TOKEN", output
    assert_equal 1, $?.exitstatus, "conduktor should exit with status code 1"
  end
end

