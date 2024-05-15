Pod::Spec.new do |s|
  s.name          = 'ZSPINCache'
  s.version       = '3.1.2'
  s.homepage      = 'https://github.com/Zandor300/ZSPINCache'
  s.summary       = 'Fast, thread safe, parallel object cache for iOS and OS X.'
  s.authors       = { 'Zandor Smith' => 'info@zsinfo.nl' }
  s.source        = { :git => 'https://github.com/Zandor300/ZSPINCache.git', :tag => "#{s.version}" }
  s.license       = { :type => 'Apache 2.0', :file => 'LICENSE.txt' }
  s.requires_arc  = true
  s.frameworks    = 'Foundation'
  s.ios.weak_frameworks   = 'UIKit'
  s.osx.weak_frameworks   = 'AppKit'
  s.cocoapods_version = '>= 1.13.0'
  s.ios.deployment_target = '12.0'
  s.osx.deployment_target = '11.0'
  s.tvos.deployment_target = '12.0'
  s.visionos.deployment_target = '1.0'
  s.watchos.deployment_target = '4.0'
  pch_PIN = <<-EOS
#ifndef TARGET_OS_WATCH
  #define TARGET_OS_WATCH 0
#endif
EOS
  s.prefix_header_contents = pch_PIN
  s.subspec 'Core' do |sp|
      sp.source_files  = 'Source/*.{h,m}'
      sp.dependency 'ZSPINOperation', '~> 1.3.3'
  end
  s.subspec 'Arc-exception-safe' do |sp|
      sp.dependency 'ZSPINCache/Core'
      sp.source_files = 'Source/PINDiskCache.m'
      sp.compiler_flags = '-fobjc-arc-exceptions'
  end
  s.resource_bundles = { 'PINCache' => ['Source/PrivacyInfo.xcprivacy'] }
end
