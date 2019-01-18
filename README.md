# SimpleKit

[![CI Status](https://img.shields.io/travis/amr.omraan@icloud.com/SimpleKit.svg?style=flat)](https://travis-ci.org/amr.omraan@icloud.com/SimpleKit)
[![Version](https://img.shields.io/cocoapods/v/SimpleKit.svg?style=flat)](https://cocoapods.org/pods/SimpleKit)
[![License](https://img.shields.io/cocoapods/l/SimpleKit.svg?style=flat)](https://cocoapods.org/pods/SimpleKit)
[![Platform](https://img.shields.io/cocoapods/p/SimpleKit.svg?style=flat)](https://cocoapods.org/pods/SimpleKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SimpleKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SimpleKit', :git => 'https://github.com/amrOmran89/SimpleKit-iOS.git'
```

## Author

Amr Omran

## Usage

### Quick Start

#### To make http request
```swift
import UIKit
import SimpleKit

class ViewController: UIViewController {

    let indicator = UIActivityIndicatorView(style: .gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func button(_ sender: Any) {
        
        ClientService.HTTPRequest(baseURL: "https://reqres.in", path: "/api/users", httpMethod: .get)
          .build { (result: Data) in
                print(result.name)
          }
    }
    
}

struct Data: Decodable {
    let name: String
    let job: String
    let id: String
    let createdAt: String
}

```

## License

SimpleKit is available under the MIT license. See the LICENSE file for more info.
