source 'https://cdn.cocoapods.org/'

platform :ios, '13.0'

use_frameworks!
inhibit_all_warnings!

abstract_target 'defaults' do

  pod 'SwiftLint', '~> 0.40'
  pod 'Swinject', '~> 2.7.0'
  pod 'R.swift', '~> 5.2.0'
  pod 'XCGLogger', '~> 7.0.0'
  pod 'AlamofireEasyLogger', '~> 1.5'
  pod 'SwiftFormat/CLI', '~> 0.46'
  pod 'Moya/RxSwift', '~> 14.0.0'
  pod 'RxCocoa', '~> 5.1.0'
  pod 'RxSwift', '~> 5.1.0'
  pod 'RxDataSources', '~> 4.0'
  pod 'RxOptional', '~> 4.0'
  pod 'RxSwiftExt', '~> 5'

  # App

  target 'FactsAboutChuck'

  # Unit tests

  target 'FactsAboutChuck Tests' do
      pod 'DeallocTests', '~> 1.0.1'
  end
end

# Workaround for Xcode 12 to set deployment targets greater than or equal to iOS 9.0
post_install do |installer|
   installer.pods_project.targets.each do |target|
     target.build_configurations.each do |config|
       if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].split('.')[0].to_i < 9
         config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
       end
     end
   end
end
