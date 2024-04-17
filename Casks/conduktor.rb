cask "conduktor" do
  version "2.24.9"
  sha256 ""
    sha256 "fa9366619bbfcb3a56dc31514459403cd7c1b80fa64f5ee1ee90bc6cf978a89f"
    url "https://github.com/conduktor/builds/releases/download/v#{version}/Conduktor-#{version}.pkg", verified: "github.com/conduktor/"
  else
    sha256 "fa9366619bbfcb3a56dc31514459403cd7c1b80fa64f5ee1ee90bc6cf978a89f"
    url "https://github.com/conduktor/builds/releases/download/v#{version}/Conduktor-#{version}.pkg", verified: "github.com/conduktor/"
  end

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
