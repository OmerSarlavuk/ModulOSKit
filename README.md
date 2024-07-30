<img width="1200" height="750" alt="Lion" src="https://github.com/user-attachments/assets/f382cd39-4d82-462d-b8ee-2a532579f2f0">



# ModulOSKit

[![Version](https://img.shields.io/cocoapods/v/ModulOSKit.svg?style=flat)](https://cocoapods.org/pods/ModulOSKit)
[![License](https://img.shields.io/cocoapods/l/ModulOSKit.svg?style=flat)](https://cocoapods.org/pods/ModulOSKit)
[![Platform](https://img.shields.io/cocoapods/p/ModulOSKit.svg?style=flat)](https://cocoapods.org/pods/ModulOSKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.   

## Requirements

- iOS 13.0+ / Mac OS X 10.0+
- Xcode 10.0+
- Swift 5.0+


## Communication

- If you have any general questions you would like to ask, you can contact me at -> omersarlavuk6@gmail.com.
- If there is anything you would like to improve, please submit a pull request.

## Installation


ModulOSKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```bash
$ gem install cocoapods
```


```ruby
target 'Your Target Name' do

  use_frameworks!

  pod 'ModulOSKit'

end
```


Then, run the following command:

```bash
$ pod install
```


## Usage

### NetworkManager

```swift
        
        //MARK: fetchData
        NetworkManager<ResponseModel>.fetchData(url: "api_url") { data, message in
            
            guard let result = data else { return }
            
            /*
            
            order process
            
            */
        }
        
        
        //MARK: postData, method -> .post
        
        //Parameters Ex.
        /* SolarDataPostDto(cityName: "City", year: 2001, month: "Month", radiation: 5.91) */
        
        NetworkManager<ResponseModel>.jsonObjectFieldData(url: "api_url", method: .post, parameters: BodyParameters) { data, message in
            
            guard let result = data else { return }
            
            /*
            
            order process
            
            */
            
        }
        
        
        //MARK: putData, method -> .put
        
        //Parameters Ex.
        /* SolarPutDto(id: 986, cityName: "City", year: 2001, month: "Month", radiation: 5.91) */
        
        NetworkManager<ResponseModel>.jsonObjectFieldData(url: "api_url", method: .put, parameters: BodyParameters) { data, message in
            
            guard let result = data else { return }
            
            /*
            
            order process
            
            */

            
        }
        
        
        //MARK: deleteData, is given directly from query
        
        //Usage Ex. -> "http://baseURL/URL?id=982" 
        
        NetworkManager<ResponseModel>.deleteData(url: "api_url") { response, message in
            
            guard let result = response else { return }
            
            /*
            
            order process
            
            */
            
        }
        
        //MARK: deleteData, is given directly from the body
        
        //Parameters Ex.
        /* SolarDataDelete(id: 988) */
        
        NetworkManager<ResponseModel>.deleteData(url: "api_url", parameters: BodyParameters) { response, message in
            
            guard let result = response else { return }
            
            /*
            
            order process
            
            */
            
        }


```

### EncodedDataAlgorithms

```swift

        let text = "normal_text"
        let key  = "encyrpt_key"
        
        let encyrpt = EncodedDataAlgorithms.encryptText(text: text, key: key)
        let decyrpt = EncodedDataAlgorithms.decryptText(encryptedText: encyrpt, key: key)

```


## Author

Ömer Şarlavuk, omersarlavuk6@gmail.com

## License

ModulOSKit is available under the MIT license. See the LICENSE file for more info.
