class ConduktorCli < Formula
  version "v0.3.0"
  sha256 "2a756ddf3c774d30d2b8a50c37072ae68974ecc6a155c0963813fc080bc6491b"

  desc "Conduktor CLI performs operations from your terminal or a CI/CD pipeline"
  homepage "https://www.conduktor.io/"
  url "https://github.com/conduktor/ctl/archive/refs/tags/#{version}.tar.gz", verified: "https://github.com/conduktor"
  license "Apache-2.0"
  head "https://github.com/conduktor/ctl.git", branch: "main"

  depends_on "go" => :build

  def install
    gitSha = "9911cbe9b956095ea29394fb1f7da95d39d0625f"
    system "go", "build", *std_go_args(ldflags: "-s -w -X 'github.com/conduktor/ctl/utils.version=v#{version}' -X 'github.com/conduktor/ctl/utils.hash=#{gitSha}'", output: bin/"conduktor")
  end

  test do
    assert_predicate bin/"conduktor", :exist?
    output = `#{bin}/conduktor 2>&1`
    
    assert_match "Please set CDK_TOKEN", output
    assert_equal 1, $?.exitstatus, "conduktor should exit with status code 1"
  end
end

