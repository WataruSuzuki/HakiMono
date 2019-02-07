platform :ios, "10.0"
#inhibit_all_warnings!
use_frameworks!

target "KixFeed" do
    pod 'Alamofire', '~> 4.7'
    pod 'AlamofireImage', '~> 3.4'
    pod 'DJKFlatIconAuthors', :git => 'https://github.com/WataruSuzuki/DJKFlatIconAuthors.git'
    pod 'PersonalizedAdConsent'
    pod 'GoogleMobileAdsMediationNend'
    pod 'DZNEmptyDataSet'
    pod 'SimpleKeychain'
    pod 'PureLayout'
    pod 'TinyConstraints'
    # pod 'Parchment'
    # pod 'AppAuth'
    # pod 'BarcodeScanner'
    # pod 'ActionSheetPicker-3.0'
    # pod 'QRCodeReader.swift', '~> 9.0.1'
    # pod 'QRCode'
    # pod 'SwiftyStoreKit'
    # pod 'NewPopMenu', '~> 2.0'
    # pod 'PullToMakeSoup', '~> 2.0'
    # pod 'FloatingPanel'

    target 'KixFeedTests' do
        inherit! :search_paths
        # pod 'Firebase'
    end
end

post_install do | installer |
    require 'fileutils'
    FileUtils.cp_r('Pods/Target Support Files/Pods-KixFeed/Pods-KixFeed-acknowledgements.plist', 'KixFeed/Settings.bundle/Pods-acknowledgements.plist')
end
