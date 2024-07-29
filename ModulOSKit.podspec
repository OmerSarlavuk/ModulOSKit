Pod::Spec.new do |s|
  s.name             = 'ModulOSKit'
  s.version          = '0.1.0'
  s.summary          = 'ModulOSKit is a library containing ready-made components, modules and network operations.'

  s.description      = <<-DESC
  ModulOSKit is a library containing ready-made components, modules and network operations. Building structures;

      1-) Warning
         Warnings appear at moments that indicate a situation. These can be 'successful, consequential and informative'.

      2-) Network
         HTTP operations are run by integrating the 'Alamofire' library for the connection through which Restful_API flights are transmitted. These are 'GET', 'POST', 'PUT' and 'DELETE' operations.

      3-) Encryption and Decryption
         It is important to encrypt data and hide sensitive data and it has been used as intended. For example, it can be used to hide the user's password.

      4-) ViewComponent
         There are some structures that are frequently used. It is formatted to receive external parameters.
                       DESC

  s.homepage         = 'https://github.com/OmerSarlavuk/ModulOSKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'OmerSarlavuk' => 'omersarlavuk6@gmail.com' }
  s.source           = { :git => 'https://github.com/OmerSarlavuk/ModulOSKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.source_files = 'ModulOSKit/Classes/**/*'
  s.dependency "Alamofire", "~> 5.9"
  
end
