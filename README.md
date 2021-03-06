# SimpleKit

[![CI Status](https://img.shields.io/travis/amr.omraan@icloud.com/SimpleRealm.svg?style=flat)](https://travis-ci.org/amr.omraan@icloud.com/SimpleRealm)
[![Version](https://img.shields.io/cocoapods/v/SimpleRealm.svg?style=flat)](https://cocoapods.org/pods/SimpleRealm)
[![License](https://img.shields.io/cocoapods/l/SimpleRealm.svg?style=flat)](https://cocoapods.org/pods/SimpleRealm)
[![Platform](https://img.shields.io/cocoapods/p/SimpleRealm.svg?style=flat)](https://cocoapods.org/pods/SimpleRealm)

## Requirements

- iOS 11.0+
- Xcode 10.0+
- Swift 4.2+

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

#### To make Http GET request
```swift
import UIKit
import SimpleKit

class ViewController: UIViewController {
    
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


#### To make Http GET request with queries
```swift
import UIKit
import SimpleKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func button(_ sender: Any) {
        
        ClientService.HTTPRequest(
            baseURL: "https://reqres.in",
            path: "/api/users",
            httpMethod: .get,
            queryItems: [URLQueryItem(name: "page", value: "2")]
        )
            .build { (result: Response) in
                print(result.data.first?.avatar)
            }
        
    }
    
}

struct Response: Decodable {
    let page: Int
    let per_page: Int
    let total: Int
    let total_pages: Int
    let data: [Data]
}

struct Data: Decodable {
    let id: Int
    let first_name: String
    let last_name: String
    let avatar: String
}

```

## License

SimpleKit is available under the MIT license. See the LICENSE file for more info.
