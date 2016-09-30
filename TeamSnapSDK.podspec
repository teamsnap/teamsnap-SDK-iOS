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
  s.source_files = 'TeamSnapSDK/*.{h,m}'  
  s.subspec 'Profiler' do |sp|
    sp.source_files = 'TeamSnapSDK/Profiler/*.{h,m}'
  end
  s.subspec 'SDK' do |sp|
    sp.source_files = 'TeamSnapSDK/SDK/*.{h,m}'
    
	sp.subspec 'Cache' do |spSDK|
	  spSDK.source_files = 'TeamSnapSDK/SDK/Cache/*.{h,m}'
	end

	sp.subspec 'CollectionJSON' do |spSDK|
	  spSDK.source_files = 'TeamSnapSDK/SDK/CollectionJSON/*.{h,m}'
	end

	sp.subspec 'Conveniences' do |spSDK|
	  spSDK.source_files = 'TeamSnapSDK/SDK/Conveniences/*.{h,m}'
	end

    sp.subspec 'DataLayer' do |spSDK|
      spSDK.source_files = 'TeamSnapSDK/SDK/DataLayer/*.{h,m}'
	end  
	
    sp.subspec 'DataTypes' do |spSDK|
      spSDK.source_files = 'TeamSnapSDK/SDK/DataTypes/**/*.{h,m}'
	end  
	
    sp.subspec 'Protocols' do |spSDK|
      spSDK.source_files = 'TeamSnapSDK/SDK/Protocols/*.{h,m}'
	end  
	
  end
end
