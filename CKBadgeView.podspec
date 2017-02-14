Pod::Spec.new do |s|
  s.name         = "CKBadgeView"
  s.version      = "0.0.1"
  s.summary      = "A lightweight extension to add badge for UIView"
  s.description  = <<-DESC
  CKBadgeView is an OBJC category for user to add badge to a UIView. 
  It is easy to use, and just one line of code, then you can add a badge with default behaviour.
                   DESC

  s.homepage     = "https://github.com/enix223/CKBadgeView"
  s.license      = "MIT"


  s.author             = { "Enix Yu" => "enix223@163.com" }
  s.social_media_url   = "http://twitter.com/enixyu"

  s.platform     = :ios
  s.platform     = :ios, "6.0"

  s.source       = { :git => "https://github.com/enix223/CKBadgeView.git", :tag => "#{s.version}" }
  s.source_files  = "Sources", "Sources/**/*.{h,m}"
  s.exclude_files = "Sources/Exclude"

  s.framework  = "QuartzCore"
  s.requires_arc = true
end
