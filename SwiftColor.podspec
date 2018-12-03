Pod::Spec.new do |s|

  s.name         = "SwiftColor"
  s.version      = "1.2.0"
  s.summary      = "Swift Color Extensions"
  s.homepage     = "https://github.com/icodesign/SwiftColor"
  s.license      = "MIT"
  s.author       = { "icodesign" => "leimagnet@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/icodesign/SwiftColor.git", :tag => s.version }

  s.source_files  = "SwiftColor", "SwiftColor/**/*.{swift}"

  s.ios.deployment_target     = '10.0'
  s.osx.deployment_target     = '10.12'

  s.requires_arc = true

end
