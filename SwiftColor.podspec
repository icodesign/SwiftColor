Pod::Spec.new do |s|

  s.name         = "SwiftColor"
  s.version      = "0.4.0"
  s.summary      = "Swift Color Extensions"
  s.homepage     = "https://github.com/icodesign/SwiftColor"
  s.license      = "MIT"
  s.author       = { "icodesign" => "leimagnet@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/iCodesign/SwiftColor.git", :tag => s.version }

  s.source_files  = "SwiftColor", "SwiftColor/**/*.{swift}"

  s.requires_arc = true

end
