Pod::Spec.new do |s|
  s.name             = "CiNiiKit"
  s.version          = "0.0.4"
  s.summary          = "CiNii API client written in Swift"

  s.description      = <<-DESC
  CiNii API client written in Swift.
                       DESC

  s.homepage         = "https://github.com/YutoMizutani/CiNiiKit"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Yuto Mizutani" => "yuto.mizutani.dev@gmail.com" }
  s.source           = { :git => "https://github.com/YutoMizutani/CiNiiKit.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/EXPENSIVE_MAN'

  s.ios.deployment_target = '8.0'

  s.requires_arc = true

  s.dependency 'Alamofire'
  s.source_files = 'Sources/**/*.swift'
end
