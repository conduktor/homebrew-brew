cask "conduktor" do
  version "2.24.9"
  if Hardware::CPU.intel?
    sha256 "06238788320f4e28d0985b52a30afcef41983c1a1b6e1690fc5297a38a1ffb68"
    url "https://github.com/conduktor/builds/releases/download/v#{version}/Conduktor-#{version}-intel.pkg", verified: "github.com/conduktor/"
    pkg "Conduktor-#{version}-intel.pkg"
  else
    sha256 "34ade35bfcd493f0f319740550e86dcba06dc6f149f245e007a750f666789721"
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
