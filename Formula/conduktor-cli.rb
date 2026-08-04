class ConduktorCli < Formula
  version "0.9.0"
  sha256 "a0abd91e22e1ad1f338551bc8247ad6e4060f1e7cf8a5ab6ffbe9363b07e5c86"

  desc "Conduktor CLI performs operations from your terminal or a CI/CD pipeline"
  homepage "https://www.conduktor.io/"
  url "https://github.com/conduktor/ctl/archive/refs/tags/v#{version}.tar.gz", verified: "https://github.com/conduktor"
  license "Apache-2.0"
  head "https://github.com/conduktor/ctl.git", branch: "main"

  depends_on "go" => :build

  def install
    gitSha = "25b55471e455c4ef14159e73adbdb533de2417cf"
    system "go", "build", *std_go_args(ldflags: "-s -w -X 'github.com/conduktor/ctl/internal/utils.version=#{version}' -X 'github.com/conduktor/ctl/internal/utils.hash=#{gitSha}'", output: bin/"conduktor")
  end

  test do
    assert_predicate bin/"conduktor", :exist?
    output = `#{bin}/conduktor 2>&1`
    
    assert_match "Please set CDK_TOKEN", output
    assert_equal 1, $?.exitstatus, "conduktor should exit with status code 1"
  end
end

