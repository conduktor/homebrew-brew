cask "conduktor" do
  version "2.16.3"
  sha256 "2416271bdf2233133aeb09dbc740b7187e4a1dfd30583f63fadde7eb8c032a1e"

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
