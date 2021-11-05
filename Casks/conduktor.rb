cask "conduktor" do
  version "2.18.6"
  sha256 "09961f7895582369ab29b6c7811775b627f77c7ce4f2755272a593bba92663bf"

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
