class ConduktorCli < Formula
  version "0.2.7"
  sha256 "a4028c78797ce49db0ce8f0a6ac1465c03383a1d5b3e412f73cbc218b077720a"

  desc "Conduktor CLI performs operations from your terminal or a CI/CD pipeline"
  homepage "https://www.conduktor.io/"
  url "https://github.com/conduktor/ctl/archive/refs/tags/v#{version}.tar.gz", verified: "https://github.com/conduktor"
  license "Apache-2.0"
  head "https://github.com/conduktor/ctl.git", branch: "main"

  depends_on "go" => :build

  def install
    gitSha = "62a00d4807eb7e7d851055e33f50a8a48c376168"
    system "go", "build", *std_go_args(ldflags: "-s -w -X 'github.com/conduktor/ctl/utils.version=v#{version}' -X 'github.com/conduktor/ctl/utils.hash=#{gitSha}'", output: bin/"conduktor")
  end

  test do
    assert_predicate bin/"conduktor", :exist?
    output = `#{bin}/conduktor 2>&1`
    
    assert_match "Please set CDK_TOKEN", output
    assert_equal 1, $?.exitstatus, "conduktor should exit with status code 1"
  end
end

