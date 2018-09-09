# CiNiiKit

[![Build Status](https://travis-ci.com/YutoMizutani/CiNiiKit.svg?branch=master)](https://travis-ci.com/YutoMizutani/CiNiiKit)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/YutoMizutani/CiNiiKit/blob/master/LICENSE)

CiNii API client written in Swift.

## Get Started

A sample of CiNii Article search,

```swift
import CiNiiKit

let cinii: CiNiiKit = CiNiiKit.shared
cinii.register(key: "ENTER YOUR API KEY")
let keyword: String = "ENTER YOUR SEARCH WORD"
cinii.articles.search(keyword: keyword, success: { model in
 	// e.g. get first journal title
 	print(model.graph[0].items?[0].title)
}, failure: { error in
	print(error)
})
```

## Demo

[Demo app](https://github.com/YutoMizutani/CiNiiKit/tree/master/Demo) is a sample of CiNii Articles.

![](https://raw.githubusercontent.com/YutoMizutani/CiNiiKit/media/demo.gif)

## Installation

#### Cocoapods

Add this to your Podfile:

```
pod 'CiNiiKit'
```

and

```
$ pod install
```

#### Carthage

Add this to your Cartfile:

```
github "YutoMizutani/CiNiiKit"
```

and

```
$ carthage update
```

## Get API key

This API is required key(application ID). Register [this page](https://support.nii.ac.jp/en/cinii/api/developer).

## References

- [CiNii - Metadata and API](https://support.nii.ac.jp/en/cinii/api/api_outline)

## License

CiNiiKit is available under the [MIT license](https://github.com/YutoMizutani/CiNiiKit/blob/master/LICENSE).