class ConduktorCli < Formula
  version "0.2.4"
  sha256 "02450b94cf4a1b500aa114a1ac25aa109de5696c19734965d95d73d248ab8a49"
  desc "Conduktor CLI performs operations from your terminal or a CI/CD pipeline"
  homepage "https://www.conduktor.io/"
  url "https://github.com/conduktor/ctl/archive/refs/tags/#{version}.tar.gz", verified: "https://github.com/conduktor"
  license "Apache-2.0"
  head "https://github.com/conduktor/ctl.git", branch: "main"

  depends_on "go" => :build

  def install
    gitSha = "15e9eaacdd6b020581d6ce6dd95f23d3ac5b3d5f"
    system "go", "build", *std_go_args(ldflags: "-s -w -X 'github.com/conduktor/ctl/utils.version=#{version}' -X 'github.com/conduktor/ctl/utils.hash=#{gitSha}'", output: bin/"conduktor")
  end

  test do
    assert_predicate bin/"conduktor", :exist?
    output = `#{bin}/conduktor 2>&1`
    
    assert_match "Please set CDK_TOKEN", output
    assert_equal 1, $?.exitstatus, "conduktor should exit with status code 1"
  end
end

