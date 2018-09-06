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
            /// Base URL
            private static let base = "http://ci.nii.ac.jp/opensearch"
            /// CiNii Articles OpenSearch for Articles query
            public static let search = "\(API.Articles.OpenSearch.base)/search"
            /// CiNii Articles OpenSearch for Authors query
            public static let author = "\(API.Articles.OpenSearch.base)/author"
            /// CiNii Articles OpenSearch for Articles query
            public static let fullText = "\(API.Articles.OpenSearch.base)/fulltext"
        }
    }

    /// CiNii Books - https://ci.nii.ac.jp/books/
    public enum Books {
        /// CiNii Books OpenSearch API
        public enum OpenSearch {
            /// Base URL
            private static let base = "http://ci.nii.ac.jp/books/opensearch"
            /// CiNii Books OpenSearch query for Books & Journals
            public static let search = "\(API.Books.OpenSearch.base)/search"
            /// CiNii Books OpenSearch query for Authors
            public static let author = "\(API.Books.OpenSearch.base)/author"
            /// CiNii Books OpenSearch for Libraries query
            public static let library = "\(API.Books.OpenSearch.base)/library"
            /// CiNii Books OpenSearch for Holdings query
            public static let holder = "\(API.Books.OpenSearch.base)/holder"
        }
    }

    /// CiNii Dissertations - https://ci.nii.ac.jp/d/
    public enum Dissertations {
        /// CiNii Dissertations OpenSearch API
        public enum OpenSearch {
            /// Base URL
            private static let base = "http://ci.nii.ac.jp/d"
            /// CiNii Dissertations OpenSearch query
            public static let search = "\(API.Dissertations.OpenSearch.base)/search"
        }
    }
}
