class ConduktorCli < Formula
  version "0.7.1"
  sha256 "1a1b62b1736c5906219ec720f24c3ff0ec16dd94bd935622cd0cec152b646e56"

  desc "Conduktor CLI performs operations from your terminal or a CI/CD pipeline"
  homepage "https://www.conduktor.io/"
  url "https://github.com/conduktor/ctl/archive/refs/tags/v#{version}.tar.gz", verified: "https://github.com/conduktor"
  license "Apache-2.0"
  head "https://github.com/conduktor/ctl.git", branch: "main"

  depends_on "go" => :build

  def install
    gitSha = "844fc8812559ac7d8f8517797e137d2370482d9e"
    system "go", "build", *std_go_args(ldflags: "-s -w -X 'github.com/conduktor/ctl/internal/utils.version=#{version}' -X 'github.com/conduktor/ctl/internal/utils.hash=#{gitSha}'", output: bin/"conduktor")
  end

  test do
    assert_predicate bin/"conduktor", :exist?
    output = `#{bin}/conduktor 2>&1`
    
    assert_match "Please set CDK_TOKEN", output
    assert_equal 1, $?.exitstatus, "conduktor should exit with status code 1"
  end
end

