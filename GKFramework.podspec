Pod::Spec.new do |s|
  s.name         = "GKFramework"
  s.version      = "0.0.4"
  s.summary      = "A short description of GKFramework.so you can use it"
  s.description  = <<-DESC
                   this is gk framework, use it for test your framework. we can use it as framework.
		   DESC
  s.homepage     = "https://github.com/wongstar/GKFramework"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "wongstar" => "wongstar.iac@gmail.com" } 
  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "7.0"

  s.source       = { :git => "https://github.com/wongstar/GKFramework.git", :tag => "#{s.version}" }
  s.source_files  = 'Classes/**/*'
  #s.public_header_files='GKFramework/Classes/**/*.h'


  
end
