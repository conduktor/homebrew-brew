class ConduktorCli < Formula
  version "0.3.3"
  sha256 "35048cecaca20413b4d352e949f9e079303001b8c69f816051f720e6dc77a772"

  desc "Conduktor CLI performs operations from your terminal or a CI/CD pipeline"
  homepage "https://www.conduktor.io/"
  url "https://github.com/conduktor/ctl/archive/refs/tags/v#{version}.tar.gz", verified: "https://github.com/conduktor"
  license "Apache-2.0"
  head "https://github.com/conduktor/ctl.git", branch: "main"

  depends_on "go" => :build

  def install
    gitSha = "4731bdc890e0395caa0c851d578c646c729aac3a"
    system "go", "build", *std_go_args(ldflags: "-s -w -X 'github.com/conduktor/ctl/utils.version=#{version}' -X 'github.com/conduktor/ctl/utils.hash=#{gitSha}'", output: bin/"conduktor")
  end

  test do
    assert_predicate bin/"conduktor", :exist?
    output = `#{bin}/conduktor 2>&1`
    
    assert_match "Please set CDK_TOKEN", output
    assert_equal 1, $?.exitstatus, "conduktor should exit with status code 1"
  end
end

