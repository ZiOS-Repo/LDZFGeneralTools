#
# Be sure to run `pod lib lint LDZFGeneralTools.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LDZFGeneralTools'
  s.version          = '0.1.2'
  s.summary          = 'A short description of LDZFGeneralTools.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/ZiOS-Repo/LDZFGeneralTools'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhuyuhui434@gmail.com' => 'zhuyuhui434@gmail.com' }
  s.source           = { :git => 'https://github.com/ZiOS-Repo/LDZFGeneralTools.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  # s.source_files = 'LDZFGeneralTools/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LDZFGeneralTools' => ['LDZFGeneralTools/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.public_header_files = 'LDZFGeneralTools/**/LDZFGeneralTools.h'
  s.source_files = 'LDZFGeneralTools/**/LDZFGeneralTools.h'
  
  s.subspec 'DateFormatter' do |ss|
    ss.source_files = 'LDZFGeneralTools/**/DateFormatter/*.{h,m}'
  end
  
  s.subspec 'DeepLinkModel' do |ss|
    ss.source_files = 'LDZFGeneralTools/**/DeepLinkModel/*.{h,m}'
  end
  
  s.subspec 'FileManager' do |ss|
    ss.source_files = 'LDZFGeneralTools/**/FileManager/*.{h,m}'
  end
  
  s.subspec 'NSArray+IndexPath' do |ss|
    ss.source_files = 'LDZFGeneralTools/**/NSArray+IndexPath/*.{h,m}'
  end
  
  s.subspec 'IrregularElementsCreator' do |ss|
    ss.source_files = 'LDZFGeneralTools/**/IrregularElementsCreator/*.{h,m}'
  end
  
  s.subspec 'NumberFormatter' do |ss|
    ss.source_files = 'LDZFGeneralTools/**/NumberFormatter/*.{h,m}'
  end
  
  s.subspec 'RegEx' do |ss|
    ss.source_files = 'LDZFGeneralTools/**/RegEx/*.{h,m}'
    ss.dependency 'RegExCategories'
  end
  
  #设备是否越狱检测
  s.subspec 'JailBreakChecker' do |ss|
    ss.source_files = 'LDZFGeneralTools/**/JailBreakChecker/*.{h,m}'
  end
  
  #权限校验
  s.subspec 'Permission' do |ss|
    ss.source_files = 'LDZFGeneralTools/**/Permission/*.{h,m}'
  end
end
