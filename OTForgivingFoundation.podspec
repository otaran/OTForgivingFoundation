Pod::Spec.new do |s|
  s.name     = 'OTForgivingFoundation'
  s.version  = '0.0.2'
  s.license  = 'MIT'
  s.summary  = 'Tired of receiving crash reports because Foundation collection classes don\'t accept nil values? Suffer no more!'
  s.homepage = 'https://github.com/otaran/OTForgivingFoundation'
  s.author   = { 'Oleksii Taran' => 'oleksii.taran@gmail.com' }
  s.source   = { :git => 'https://github.com/otaran/OTForgivingFoundation.git', :tag => "v#{s.version}" }
  s.requires_arc = false
  s.dependency 'JRSwizzle', '~> 1.0'

  s.source_files = '*.{h,m}'

  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.8'

  s.frameworks   = 'Foundation'
end
