class ConduktorCli < Formula
  version "0.5.1"
  sha256 "b0e829fcc9cd21cb259f1052291a12ee7db6edee8e0a930b92e9a70c60363128"

  desc "Conduktor CLI performs operations from your terminal or a CI/CD pipeline"
  homepage "https://www.conduktor.io/"
  url "https://github.com/conduktor/ctl/archive/refs/tags/v#{version}.tar.gz", verified: "https://github.com/conduktor"
  license "Apache-2.0"
  head "https://github.com/conduktor/ctl.git", branch: "main"

  depends_on "go" => :build

  def install
    gitSha = "5ec681524924ae0c998192bf02fea7b5afa770a0"
    system "go", "build", *std_go_args(ldflags: "-s -w -X 'github.com/conduktor/ctl/utils.version=#{version}' -X 'github.com/conduktor/ctl/utils.hash=#{gitSha}'", output: bin/"conduktor")
  end

  test do
    assert_predicate bin/"conduktor", :exist?
    output = `#{bin}/conduktor 2>&1`
    
    assert_match "Please set CDK_TOKEN", output
    assert_equal 1, $?.exitstatus, "conduktor should exit with status code 1"
  end
end

