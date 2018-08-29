//
//  API.swift
//  CiNiiKit iOS
//
//  Created by Yuto Mizutani on 2018/08/29.
//

import Foundation

/// CiNii API
public struct API {
    /// CiNii Articles OpenSearch API
    public enum OpenSearch {
        private static let base = "http://ci.nii.ac.jp/opensearch"
        static let article = "\(API.OpenSearch.base)/search"
        static let author = "\(API.OpenSearch.base)/author"
        static let fullText = "\(API.OpenSearch.base)/fulltext"
    }
}
