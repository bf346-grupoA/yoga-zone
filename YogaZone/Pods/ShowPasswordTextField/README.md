[![Version](https://img.shields.io/cocoapods/v/ShowPasswordTextField.svg?style=flat)](https://cocoapods.org/pods/ShowPasswordTextField)
[![License](https://img.shields.io/cocoapods/l/ShowPasswordTextField.svg?style=flat)](https://cocoapods.org/pods/ShowPasswordTextField)
[![Platform](https://img.shields.io/cocoapods/p/ShowPasswordTextField.svg?style=flat)](https://cocoapods.org/pods/ShowPasswordTextField)

# ShowPasswordTextField
ShowPasswordTextField provides way to show or hide password for secure textfield.

![DemoGif](/Screenshots/ShowPasswordTextField-demo.gif)
  
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
* Swift 5+
* IOS 13+

## Installation

ShowPasswordTextField is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile and run `pod install`:

```ruby
pod 'ShowPasswordTextField'
```

Then you can import it when you need

```swift
import ShowPasswordTextField
```

## Usage

### Interface Builder
1. In your storyboard, Drag and drop a `UITextField` to a ViewController.
2. In Identity Inspector > Custom class, change the class to `ShowPasswordTextField` and the module to `ShowPasswordTextField`.

![Screenshot](Screenshots/screenshot-Identity-Inspector.png)

3. Configure your properties in the Attribute Inspector.

![Screenshot](Screenshots/screenshot-properties.png)

### Programmatically
```Swift
let textField = ShowPasswordTextField(frame: CGRect(x: 0, y: 0, width: 240, height: 44))
textField.borderStyle = .bezel
textField.tintIconColor = .red
textField.sizeIcon = 32
view.addSubview(textField)
```

## Author

k.angama, karim.angama@gmail.com

## License

ShowPasswordTextField is available under the MIT license. See the [LICENSE](https://github.com/K-Angama/ShowPasswordTextField/blob/master/LICENSE) file for more info.
