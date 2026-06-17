class ConduktorCli < Formula
  version "0.8.0"
  sha256 "68113de5f2fc67c71a8abe006fb7c7b8dc440d0c3ca2968ce92d956068baec93"

  desc "Conduktor CLI performs operations from your terminal or a CI/CD pipeline"
  homepage "https://www.conduktor.io/"
  url "https://github.com/conduktor/ctl/archive/refs/tags/v#{version}.tar.gz", verified: "https://github.com/conduktor"
  license "Apache-2.0"
  head "https://github.com/conduktor/ctl.git", branch: "main"

  depends_on "go" => :build

  def install
    gitSha = "11d77ca6cd64ffae3fa98056b9aa75e90774b07e"
    system "go", "build", *std_go_args(ldflags: "-s -w -X 'github.com/conduktor/ctl/internal/utils.version=#{version}' -X 'github.com/conduktor/ctl/internal/utils.hash=#{gitSha}'", output: bin/"conduktor")
  end

  test do
    assert_predicate bin/"conduktor", :exist?
    output = `#{bin}/conduktor 2>&1`
    
    assert_match "Please set CDK_TOKEN", output
    assert_equal 1, $?.exitstatus, "conduktor should exit with status code 1"
  end
end

