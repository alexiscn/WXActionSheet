Pod::Spec.new do |s|
  s.name         = 'WXActionSheet'
  s.version      = '0.6.0'
  s.license = 'MIT'
  s.requires_arc = true
  s.source = { :git => 'https://github.com/alexiscn/WXActionSheet.git', :tag => s.version.to_s }

  s.summary         = 'WXActionSheet'
  s.homepage        = 'https://github.com/alexiscn/WXActionSheet'
  s.license         = { :type => 'MIT' }
  s.author          = { 'xushuifeng' => 'shuifengxu@gmail.com' }
  s.platform        = :ios
  s.swift_version   = '5.0'
  s.source_files    =  'Source/**/*.{swift}'
  s.ios.deployment_target = '11.0'
  
end
