Pod::Spec.new do |spec|
  spec.name         = 'testInternal'
  spec.version      = '1.0'
  spec.authors      = { 
    'Anand Kumar' => 'anandsion111@gmail.com',
    'Another Anand Kumar' => 'anandsion111@gmail.com'
  }
  spec.license      = { 
    :type => 'MIT',
    :file => 'LICENSE' 
  }
  spec.homepage     = 'https://github.com/anandsion111/testInternal'
  spec.source       = { 
    :git => 'https://github.com/anandsion111/testInternal', 
    :branch => 'master',
    :tag => spec.version.to_s  
  }
  spec.summary      = 'IOS SDK for Internal Testing'
  spec.source_files = '**/*.swift', '*.swift'
  spec.swift_versions = '5.0'
  spec.ios.deployment_target = '14.4'
end