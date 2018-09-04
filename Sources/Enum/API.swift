//
//  API.swift
//  CiNiiKit
//
//  Created by Yuto Mizutani on 2018/08/29.
//

import Foundation

/// CiNii API
public struct API {
    /// CiNii Articles - https://ci.nii.ac.jp/
    public enum Articles {
        /// CiNii Articles OpenSearch API
        public enum OpenSearch {
            private static let base = "http://ci.nii.ac.jp/opensearch"
            static let search = "\(API.Articles.OpenSearch.base)/search"
            static let author = "\(API.Articles.OpenSearch.base)/author"
            static let fullText = "\(API.Articles.OpenSearch.base)/fulltext"
        }
    }

    /// CiNii Books - https://ci.nii.ac.jp/books/
    public enum Books {
        /// CiNii Books OpenSearch API
        public enum OpenSearch {
            private static let base = "http://ci.nii.ac.jp/books/opensearch"
            static let search = "\(API.Books.OpenSearch.base)/search"
            static let author = "\(API.Books.OpenSearch.base)/author"
            static let library = "\(API.Books.OpenSearch.base)/library"
            static let holder = "\(API.Books.OpenSearch.base)/holder"
        }
    }

    /// CiNii Dissertations - https://ci.nii.ac.jp/d/
    public enum Dissertations {
        /// CiNii Dissertations OpenSearch API
        public enum OpenSearch {
            private static let base = "http://ci.nii.ac.jp/d"
            static let search = "\(API.Dissertations.OpenSearch.base)/search"
        }
    }
}
