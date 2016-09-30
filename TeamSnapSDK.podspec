Pod::Spec.new do |s|
  s.name         = "TeamSnapSDK"
  s.version      = "1.0"
  s.summary      = "TeamSnap SDK for API v3"
  s.description  = "A library to access TeamSnap API v3"
  s.homepage     = "https://github.com/teamsnap/teamsnap-SDK-iOS"
  s.license      = { :type => 'TeamSnap Internal', :text => 'TEAMSNAP CONFIDENTIAL & INTERNAL ONLY' }
  s.author       = { "Jason Rahaim" => "jason@teamsnap.com", "Skylar Seamans" => "skylar.seamans@teamsnap.com", "Mark Gallegos" => "mark.gallegos@teamsnap.com" }
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
    
      spSDK.subspec 'Assignments' do |spTypes|
        spTypes.source_files = 'TeamSnapSDK/SDK/DataTypes/Assignments/*.{h,m}'
      end
    
      spSDK.subspec 'Leagues' do |spTypes|
        spTypes.source_files = 'TeamSnapSDK/SDK/DataTypes/Leagues/*.{h,m}'
      end
      
      spSDK.subspec 'Media' do |spTypes|
        spTypes.source_files = 'TeamSnapSDK/SDK/DataTypes/Media/*.{h,m}'
      end
      
      spSDK.subspec 'Members' do |spTypes|
        spTypes.source_files = 'TeamSnapSDK/SDK/DataTypes/Members/*.{h,m}'
      end
      
      spSDK.subspec 'Messages' do |spTypes|
        spTypes.source_files = 'TeamSnapSDK/SDK/DataTypes/Messages/*.{h,m}'
      end
      
      spSDK.subspec 'Payments' do |spTypes|
        spTypes.source_files = 'TeamSnapSDK/SDK/DataTypes/Payments/*.{h,m}'
      end
      
      spSDK.subspec 'PhotoObjects' do |spTypes|
        spTypes.source_files = 'TeamSnapSDK/SDK/DataTypes/PhotoObjects/*.{h,m}'
      end
      
      spSDK.subspec 'Statistics' do |spTypes|
        spTypes.source_files = 'TeamSnapSDK/SDK/DataTypes/Statistics/*.{h,m}'
      end
      
      spSDK.source_files = 'TeamSnapSDK/SDK/DataTypes/*.{h,m}'
    
	end  
	
    sp.subspec 'Protocols' do |spSDK|
      spSDK.source_files = 'TeamSnapSDK/SDK/Protocols/*.{h,m}'
	end  
	
  end
  
end
