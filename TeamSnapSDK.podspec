Pod::Spec.new do |s|
  s.name         = "TeamSnapSDK"
  s.version      = "1.0"
  s.summary      = "TeamSnap SDK"
  s.description  = "Access TeamSnap API v3"
  s.homepage     = "https://github.com/teamsnap/teamsnap-SDK-iOS"
  s.license      = { :type => 'TeamSnap Internal', :text => 'TEAMSNAP CONFIDENTIAL & INTERNAL ONLY' }
  s.author       = { "Mark Gallegos" => "mark.gallegos@teamsnap.com", "Jason Rahaim" => "jason@teamsnap.com", "Skylar Seamans" => "skylar.seamans@teamsnap.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "git@github.com:teamsnap/teamsnap-SDK-iOS.git", :branch => "podspec-experiment" }
  s.source_files = 'TeamSnapSDK/**/*.{h,m}'  
end
