Pod::Spec.new do |s|

  s.name         = "TeamSnapSDK"
  s.version      = "4.6"
  s.summary      = "TeamSnap SDK for API v3"
  s.description  = "A library to access TeamSnap API v3"
  s.homepage     = "https://github.com/teamsnap/teamsnap-SDK-iOS"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = {
    "Jason Rahaim" => "jason@teamsnap.com",
    "Skyler Seamans" => "skyler.seamans@teamsnap.com",
    "Mark Gallegos" => "mark.gallegos@teamsnap.com",
    "Lars Anderson" => "lars.anderson@teamsnap.com",
  }
  s.platform     = :ios, "8.0"
  s.resources    = ['TeamSnapSDK/SDK/Resources/*']
  s.source       = {
    :git => "https://github.com/teamsnap/teamsnap-SDK-iOS.git",
    :tag => "Pod-#{s.version}"
  }
  
  s.source_files = 'TeamSnapSDK/**/*.{h,m}'
end
