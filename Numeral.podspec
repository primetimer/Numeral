#
# Be sure to run `pod lib lint Numeral.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Numeral'
  s.version          = '0.1.0'
  s.summary          = 'A short description of Numeral.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/primetimer/Numeral'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'primetimer' => 'primetimertime@gmail.com' }
  s.source           = { :git => 'https://github.com/primetimer/Numeral.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

s.platforms = { :ios => "8.0", :osx => "10.7", :watchos => "2.0", :tvos => "9.0" }
#s.ios.deployment_target = '8.0'
  
  s.dependency 'BigInt'

  s.source_files = "Numeral/**/*.{swift}"
  
  # 9
  s.resources = "Numeral/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"

  #s.source_files = 'Numeral/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Numeral' => ['Numeral/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
