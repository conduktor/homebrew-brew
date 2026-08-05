class ConduktorCli < Formula
  version "0.9.2"
  sha256 "66de98d8bf7797e74b71d31253b511310a01bd1c9e259320a65ed526ff130274"

  desc "Conduktor CLI performs operations from your terminal or a CI/CD pipeline"
  homepage "https://www.conduktor.io/"
  url "https://github.com/conduktor/ctl/archive/refs/tags/v#{version}.tar.gz", verified: "https://github.com/conduktor"
  license "Apache-2.0"
  head "https://github.com/conduktor/ctl.git", branch: "main"

  depends_on "go" => :build

  def install
    gitSha = "3cc563714db5fbc2a5b5c70bc34a981d78f27a92"
    system "go", "build", *std_go_args(ldflags: "-s -w -X 'github.com/conduktor/ctl/internal/utils.version=#{version}' -X 'github.com/conduktor/ctl/internal/utils.hash=#{gitSha}'", output: bin/"conduktor")
  end

  test do
    assert_predicate bin/"conduktor", :exist?
    output = `#{bin}/conduktor 2>&1`
    
    assert_match "Please set CDK_TOKEN", output
    assert_equal 1, $?.exitstatus, "conduktor should exit with status code 1"
  end
end

