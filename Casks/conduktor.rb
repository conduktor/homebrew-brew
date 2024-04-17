cask "conduktor" do
  version "2.24.9"
  if Hardware::CPU.intel?
    sha256 "b0b1d7fe37ad5965e9d0afd93403cd6aa9f26c59539a7a7a17a119f673220d6a"
    url "https://github.com/conduktor/builds/releases/download/v#{version}/Conduktor-#{version}-intel.pkg", verified: "github.com/conduktor/"
    pkg "Conduktor-#{version}-intel.pkg"
  else
    sha256 "92affe720d8f091c9e90cee11792427a92a4904c37011a26c10905686ef692a6"
    url "https://github.com/conduktor/builds/releases/download/v#{version}/Conduktor-#{version}-apple-silicon.pkg", verified: "github.com/conduktor/"
    pkg "Conduktor-#{version}-apple-silicon.pkg"
  end

  name "conduktor"
  desc "Beautiful desktop application to manage an Apache Kafka ecosystem"
  homepage "https://www.conduktor.io/"

  uninstall pkgutil: [
    "io.conduktor.app.Conduktor",
  ]
  
  zap trash: [
    "~/Library/Application Support/conduktor",
    "~/Library/Saved Application State/io.conduktor.app.Conduktor.savedState",
  ]

end
