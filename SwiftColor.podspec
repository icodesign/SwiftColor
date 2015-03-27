Pod::Spec.new do |s|

  s.name         = "SwiftColor"
  s.version      = "0.3.0"
  s.summary      = "Swift PullToRefresh && InfiniteScrolling"
  s.homepage     = "https://github.com/iCodesign/SwiftColor"
  s.license      = "MIT"
  s.author       = { "iCodesign" => "icodesign.me@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/iCodesign/SwiftColor.git", :tag => s.version }

  s.source_files  = "SwiftColor", "SwiftColor/**/*.{swift}"

  s.requires_arc = true

end
