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

### Ready_Alert

```swift

        ReadyAlert.showAlert(
            on: view,
            state: .information,
            title: "Ready Status Notification",
            buttonTitle: .OK) {
            /* actions after click */
            }

```

<img width="349" alt="ready_status_success" src="https://github.com/user-attachments/assets/1ab7f21c-76cc-4002-a43c-7958a9a78f23">
<img width="329" alt="ready_status_information" src="https://github.com/user-attachments/assets/b7e8c715-e4e4-42ac-ab3b-93787e814512">
<img width="331" alt="ready_status_failure" src="https://github.com/user-attachments/assets/5eec8d84-7c8e-4d5f-91a3-de1e947b873c">


### Custom_Alert

```swift 
      StatusNotification.showAlert(
        on: view,
        width: 300,
        height: 250,
        viewModel: StatusNotification.AlertViewModel(
            image: .success,
            imageContentMode: .scaleAspectFit,
            title: "Status Notification ViewModel",
            textColor: .black,
            font: .boldSystemFont(ofSize: 16),
            textAligment: .center,
            buttonTitle: "Ok",
            buttonTitleColor: .white,
            buttonTitleFont: .systemFont(ofSize: 16),
            buttonBackgroundColor: UIColor(red: 0.282, green: 0.616, blue: 0.447, alpha: 1),
            buttonLayerCornerRadius: 15,
            alertBackgroundColor: .white,
            alertCornerRadius: 20,
            alertBorderWith: 1,
            alertBorderColor: UIColor.black.cgColor))

```

<img width="346" alt="custom_alert" src="https://github.com/user-attachments/assets/958e6465-d288-4a83-ba67-24d6b144252c">


### Loading

```swift

    view.startIndicator()
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
      self.view.stopIndicator()
    }

```

### Extension+UIView

```swift  

        let view_component = UIView()
         
         view_component.image_title_identifier_button_viewComponent(
            image: .success,
            title: "View Component Title",
            identifier: "View Component Long Text -> Identifier",
            backgorund: .white) {
                /* actions after click */
         }
         
         view.addSubview(view_component)
         view_component.snp.makeConstraints{
             $0.centerY.equalToSuperview()
             $0.leading.equalToSuperview().offset(16)
             $0.trailing.equalToSuperview().offset(-16)
             $0.height.equalTo(85)
         }

```

<img width="378" alt="image_title_identifier_button_viewComponent" src="https://github.com/user-attachments/assets/6ee47b3b-875a-49f3-b31b-25edc1bc71ba">



```swift  

        let view_component = UIView()
         
         view_component.image_visualTitle_viewComponent(
             image: .lion,
             effect: UIBlurEffect(style: .regular),
             title: "LİON",
             font: .boldSystemFont(ofSize: 18),
             textColor: .white,
             textAligment: .center) {
                 /* actions after click */
             }
         
         view.addSubview(view_component)
         view_component.snp.makeConstraints{
             $0.centerY.equalToSuperview()
             $0.leading.equalToSuperview().offset(32)
             $0.width.equalTo(150)
             $0.height.equalTo(180)
         }
         

```

<img width="352" alt="image_visualTitle_viewComponent" src="https://github.com/user-attachments/assets/a87c75b0-038d-4b77-8746-04b1e72cd129">


```swift  

        let view_component = UIView()
         
         view_component.icon_title_button_viewComponent(
             icon: .information,
             title: "Information",
             textColor: .black,
             font: .boldSystemFont(ofSize: 16),
             background: .white){
                 print("info_view_component")
             }
         
         view.addSubview(view_component)
         view_component.snp.makeConstraints{
             $0.centerY.equalToSuperview()
             $0.leading.equalToSuperview().offset(16)
             $0.trailing.equalToSuperview().offset(-16)
             $0.height.equalTo(65)
         }

```

<img width="374" alt="icon_title_button_viewComponent" src="https://github.com/user-attachments/assets/b915d663-96ae-4985-802b-cfec34f0121e">



```swift  

        let view_component = UIView()
         
         view_component.topIcon_bottomTitleTapped_ViewComponent(
             icon: .information,
             title: "Information",
             textAligment: .center) {
                 print("tapped!")
             }
         
         view.addSubview(view_component)
         view_component.snp.makeConstraints{
             $0.centerY.centerX.equalToSuperview()
             $0.height.width.equalTo(100)
         }

```

<img width="372" alt="Ekran Resmi 2024-07-30 13 42 26" src="https://github.com/user-attachments/assets/f4cc4dc9-f7de-4b8f-b90b-9fd46177a306">



## Author

Ömer Şarlavuk, omersarlavuk6@gmail.com

## License

ModulOSKit is available under the MIT license. See the LICENSE file for more info.
