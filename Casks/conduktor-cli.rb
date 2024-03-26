cask "conduktor-cli" do
  version "0.1.0"
  url "https://github.com/conduktor/ctl/releases/download/#{version}/conduktor-#{version}-darwin-amd64.tar.gz", verified: "https://github.com/conduktor"
  sha256 "ea1f33a0c09672143c443e19fef7c85b2217ca70623ab72754a118cb8bb5be21"

  name "Conduktor CLI"
  desc "Interact with Conduktor with a CLI to perform some operations directly from your command line or a CI/CD pipeline."
  homepage "https://www.conduktor.io/"

  binary "conduktor"
end
  
