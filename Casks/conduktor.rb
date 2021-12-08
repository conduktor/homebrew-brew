cask "conduktor" do
  version "2.19.3"
  sha256 "d53454da64fe1a849b7cf3c84415a441f768771f18c3c2d0ddc075615a4269cc"

  url "https://github.com/conduktor/builds/releases/download/v#{version}/Conduktor-#{version}.pkg", verified: "https://github.com/conduktor"
  name "conduktor"
  desc "Beautiful desktop application to manage an Apache Kafka ecosystem"
  homepage "https://www.conduktor.io/"

  pkg "Conduktor-#{version}.pkg"

  uninstall pkgutil: [
    "io.conduktor.app.Conduktor",
  ]
  
  zap trash: [
    "~/Library/Application Support/conduktor",
    "~/Library/Saved Application State/io.conduktor.app.Conduktor.savedState",
  ]

end
