Pod::Spec.new do |s|

  s.name         = "SwiftColor"
  s.version      = "1.6.0"
  s.summary      = "Swift Color Extensions"
  s.homepage     = "https://github.com/icodesign/SwiftColor"
  s.license      = "MIT"
  s.author       = { "icodesign" => "leimagnet@gmail.com" }
  s.platform     = :ios, "13.0"
  s.source       = { :git => "https://github.com/icodesign/SwiftColor.git", :tag => s.version }

  s.source_files  = "Sources/SwiftColor", "Sources/SwiftColor/**/*.{swift}"

  s.ios.deployment_target     = '13.0'
  s.osx.deployment_target     = '10.15'
  s.watchos.deployment_target = '6.0'
  s.tvos.deployment_target    = '13.0'

  s.requires_arc = true

end
