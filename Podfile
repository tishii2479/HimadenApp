# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'Himaden' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!

  # Pods for Himaden

  target 'HimadenTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'HimadenUITests' do
    # Pods for testing
  end

  def install_pods
    pod 'SkyWay'
    pod 'SnapKit', '>=3.2.0'
    pod 'FloatingPanel'
    pod 'BAFluidView'
    pod 'Alamofire'
    pod 'Firebase/Analytics'
    pod 'Firebase/Auth'
    pod 'Firebase/Core'
    pod 'Firebase/Firestore'
    pod 'RealmSwift'
    pod 'MessageKit'
  end

  install_pods
end
