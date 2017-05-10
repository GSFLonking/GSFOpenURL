Pod::Spec.new do |s|
  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.name         = "GSFOpenURL"
  s.version      = "1.0.2"
  s.summary      = "You can use GSFOpenURL to open some apps by enum type,If we add it’s URL Schemes"
  s.description  = <<-DESC
	You can use GSFOpenURL to open some apps by enum type,If we add it’s URL Schemes.
If you know some other apps URL Schemes,you can tell me,like bank app.
The GSFOpenURL1.0 only have a little Chinese apps,So please told me more app’s URL Schemes,Let me improve it.
                   DESC
  s.homepage     = "https://github.com/GSFLonking/GSFOpenURL"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # s.license      = "MIT (example)"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.author             = { "孤随风(Lowinding)" => "" }
  # Or just: s.author    = "这是简写 孤少(Lonking)"
  # s.authors            = { "GSFLonking" => "" }
  # s.social_media_url   = ""

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source       = { :git => "https://github.com/GSFLonking/GSFOpenURL.git", :tag => "#{s.version}" }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source_files  = "GSFOpenURL/GSFOpenURL/*.{h,m}"
  # s.exclude_files = "Classes/Exclude"
  # s.public_header_files = "Classes/**/*.h"

  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.resource  = "GSFOpenURL/GSFOpenURL/白名单.plist"
  # s.resources = "GSFOpenURL/GSFOpenURL/*.plist"
  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.frameworks = "UIKit"
  # s.libraries = "iconv", "xml2"

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.requires_arc = true
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
