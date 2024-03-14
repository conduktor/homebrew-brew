cask "conduktor-cli" do
  version "0.0.11"

  url "https://github.com/conduktor/ctl/releases/download/#{version}/conduktor-#{version}-darwin-amd64.tar.gz", verified: "https://github.com/conduktor"
  sha256 "1e44bda75f5893af4fda6104956f618b32cf04a9a29f5c64bf6abd39614b5f37"

  name "Conduktor CLI"
  desc "Interact with Conduktor with a CLI to perform some operations directly from your command line or a CI/CD pipeline."
  homepage "https://www.conduktor.io/"

  binary "conduktor"
end
  
