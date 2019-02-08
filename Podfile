platform :ios, "10.0"
#inhibit_all_warnings!
use_frameworks!

target "KixFeed" do
    pod 'Alamofire', '~> 4.7'
    pod 'AlamofireImage', '~> 3.4'
    pod 'DJKFlatIconAuthors', :git => 'https://github.com/WataruSuzuki/DJKFlatIconAuthors.git'
    pod 'DZNEmptyDataSet'
    pod 'SimpleKeychain'
    pod 'PureLayout'
    pod 'TinyConstraints'
    pod 'FeedKit'
    pod 'FloatingPanel'

    target 'KixFeedTests' do
        inherit! :search_paths
    end
end

target "MonetizeKit" do
    pod 'PersonalizedAdConsent'
    pod 'GoogleMobileAdsMediationNend'
    pod 'SwiftyStoreKit'
    target 'MonetizeKitTests' do
        inherit! :search_paths
    end
end

post_install do | installer |
    require 'fileutils'
    FileUtils.cp_r('Pods/Target Support Files/Pods-KixFeed/Pods-KixFeed-acknowledgements.plist', 'KixFeed/Settings.bundle/Pods-acknowledgements.plist')
end
