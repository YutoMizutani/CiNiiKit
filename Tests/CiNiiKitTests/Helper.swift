//
//  Helper.swift
//  CiNiiKit iOSTests
//
//  Created by Yuto Mizutani on 2018/09/12.
//

import Foundation

/// Test helper class
class TestHelper: NSObject {
    /// Returns a shared instance
    static let shared = TestHelper()

    /// Use of Singleton pattern with private access
    private override init() {
        super.init()
    }

    /**
     Read json

     - REMARK:
     e.g. Tests/Fixtures/example.json
     Call `.json(from: "articles")`
    */
    func json(from fileName: String) -> Data? {
        let bundle = Bundle(for: type(of: self))
        guard
            let path: URL = bundle.url(forResource: fileName, withExtension: "json"),
            let data: Data = try? Data(contentsOf: path, options: .uncached)
        else { return nil }
        return data
    }
}
