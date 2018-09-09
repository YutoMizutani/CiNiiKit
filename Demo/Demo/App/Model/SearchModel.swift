//
//  SearchModel.swift
//  Demo
//
//  Created by Yuto Mizutani on 2018/09/02.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import CiNiiKit
import UIKit

/// Search model
struct SearchModel {
    /// CiNiiKit instance
    private let cinii: CiNiiKit
    /// API key id
    private let ciNiiKitAPIKeyID = "CiNiiKitAPIKey"

    init() {
        self.cinii = CiNiiKit.shared
    }
}

// MARK: - Private methods
private extension SearchModel {
    /// Store API key
    func storeAPIKey(_ key: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(key, forKey: self.ciNiiKitAPIKeyID)
    }

    /// Restore API key
    func restoreAPIKey() -> String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: self.ciNiiKitAPIKeyID)
    }
}

// MARK: - Internal methods
extension SearchModel {
    /// Register with API key
    func register(_ key: String) {
        self.storeAPIKey(key)
        self.cinii.register(key: key)
    }

    /// Get API key
    func getKey() -> String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: self.ciNiiKitAPIKeyID)
    }

    /// Search
    func search(_ searchWord: String, success: ((ArticlesModel) -> Void)?, failure: @escaping CiNiiKit.FailureHandler) {
        self.cinii.articles.search(keyword: searchWord, success: success, failure: failure)
    }
}
