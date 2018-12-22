source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.0'
inhibit_all_warnings!
use_frameworks!

target 'Digidentity' do
    pod 'Alamofire'
    pod 'FMDB/SQLCipher'
    pod 'TesseractOCRiOS', '~>4.0'

    abstract_target 'Tests' do
        target 'DigidentityTests'

        pod 'Quick'
        pod 'Nimble'
    end
end
 
