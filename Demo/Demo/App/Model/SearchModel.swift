//
//  SearchModel.swift
//  Demo
//
//  Created by Yuto Mizutani on 2018/09/02.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import CiNiiKit
import UIKit

class SearchModel {
    private let cinii: CiNiiKit
    private let ciNiiKitAPIKeyID = "CiNiiKitAPIKey"

    init() {
        self.cinii = CiNiiKit.shared
    }

    private func storeAPIKey(_ key: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(key, forKey: self.ciNiiKitAPIKeyID)
    }

    func getAPIKey() -> String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: self.ciNiiKitAPIKeyID)
    }

    func register(_ key: String) {
        self.storeAPIKey(key)
        self.cinii.register(key: key)
    }

    func search(_ searchWord: String, success: ((ArticlesModel) -> Void)?, failure: @escaping CiNiiKit.FailureHandler) {
        self.cinii.articles.search(keyword: searchWord, success: success, failure: failure)
    }
}
