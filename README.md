# CiNiiKit

[![Build Status](https://travis-ci.com/YutoMizutani/CiNiiKit.svg?branch=master)](https://travis-ci.com/YutoMizutani/CiNiiKit)
[![CocoaPods](https://img.shields.io/cocoapods/p/CiNiiKit.svg)](https://github.com/YutoMizutani/CiNiiKit)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/YutoMizutani/CiNiiKit/blob/master/LICENSE)
[![CocoaPods](https://img.shields.io/cocoapods/v/CiNiiKit.svg)](https://github.com/YutoMizutani/CiNiiKit)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/YutoMizutani/CiNiiKit)

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

## Support

It fully supports CiNii APIs!

Supports multiple query parameters in call methods,

#### [CiNii Articles](https://ci.nii.ac.jp/en)

1. [`search()`](https://github.com/YutoMizutani/CiNiiKit/blob/master/Sources/Endpoints/OpenSearchArticles.swift#L135)

	Get a result of search articles from CiNii Articles.

2. [`author()`](https://github.com/YutoMizutani/CiNiiKit/blob/master/Sources/Endpoints/OpenSearchArticles.swift#L196)

	Get a result of search authors from CiNii Articles.

3. [`fulltext()`](https://github.com/YutoMizutani/CiNiiKit/blob/master/Sources/Endpoints/OpenSearchArticles.swift#L242)

	Get a result of search full text from CiNii Articles.

#### [CiNii Books](https://ci.nii.ac.jp/books/?l=en)

1. [`search()`](https://github.com/YutoMizutani/CiNiiKit/blob/master/Sources/Endpoints/OpenSearchBooks.swift#L183)

	Get a result of search books from CiNii Books.

2. [`author()`](https://github.com/YutoMizutani/CiNiiKit/blob/master/Sources/Endpoints/OpenSearchBooks.swift#L256)

	Get a result of search for authors from CiNii Books.

3. [`library()`](https://github.com/YutoMizutani/CiNiiKit/blob/master/Sources/Endpoints/OpenSearchBooks.swift#L296)

	Get a result of search for libraries from CiNii Books.

4. [`holding()`](https://github.com/YutoMizutani/CiNiiKit/blob/master/Sources/Endpoints/OpenSearchBooks.swift#L346)

	Get a result of search for holdings from CiNii Books.

#### [CiNii Dissartations](https://ci.nii.ac.jp/d/?l=en)

1. [`search()`](https://github.com/YutoMizutani/CiNiiKit/blob/master/Sources/Endpoints/OpenSearchDissertations.swift#L117)

	Get a result of search dissertations from CiNii Dissertations.

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