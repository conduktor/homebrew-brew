class ConduktorCli < Formula
  version "0.9.3"
  sha256 "8f342093551fc2c1762744df34cca97507eadb35f23cd2ca5ea18b61417ad9bf"

  desc "Conduktor CLI performs operations from your terminal or a CI/CD pipeline"
  homepage "https://www.conduktor.io/"
  url "https://github.com/conduktor/ctl/archive/refs/tags/v#{version}.tar.gz", verified: "https://github.com/conduktor"
  license "Apache-2.0"
  head "https://github.com/conduktor/ctl.git", branch: "main"

  depends_on "go" => :build

  def install
    gitSha = "954dd3934ce91f6783f000d62ea970ef7f1fb612"
    system "go", "build", *std_go_args(ldflags: "-s -w -X 'github.com/conduktor/ctl/internal/utils.version=#{version}' -X 'github.com/conduktor/ctl/internal/utils.hash=#{gitSha}'", output: bin/"conduktor")
  end

  test do
    assert_predicate bin/"conduktor", :exist?
    output = `#{bin}/conduktor 2>&1`
    
    assert_match "Please set CDK_TOKEN", output
    assert_equal 1, $?.exitstatus, "conduktor should exit with status code 1"
  end
end

