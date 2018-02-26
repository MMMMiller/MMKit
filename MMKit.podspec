Pod::Spec.new do |s|
  s.name         = 'MMKit'
  s.summary      = 'A collection of iOS components.'
  s.version      = '0.0.1'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'MMMille' => 'xuemingluan@gmail.com' }
  #s.social_media_url = 'http://blog.MMMille.com'
  s.homepage     = 'https://github.com/MMMille/MMKit'
  s.platform     = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.source       = { :git => 'https://github.com/MMMille/MMKit.git', :tag => s.version.to_s }
  
  s.requires_arc = true
  s.source_files = 'MMKit/**/*.{h,m}'
  s.public_header_files = 'MMKit/**/*.{h}'

  s.libraries = 'z', 'sqlite3'
  s.frameworks = 'UIKit', 'CoreFoundation', 'CoreText', 'CoreGraphics', 'CoreImage', 'QuartzCore', 'ImageIO', 'AssetsLibrary', 'Accelerate', 'MobileCoreServices', 'SystemConfiguration'

end
#pod repo push MMKit MMKit.podspec --allow-warnings --sources='https://github.com/CocoaPods/Specs.git'