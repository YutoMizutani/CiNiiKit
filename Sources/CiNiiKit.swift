//
//  CiNiiKit.swift
//  CiNiiKit
//
//  Created by Yuto Mizutani on 2018/08/27.
//

import UIKit

/// A set of helper functions to make the Instagram API easier to use.
public class CiNiiKit {

    /// CiNii Articles - https://ci.nii.ac.jp/
    public let articles = CiNiiKitArticles.shared
//    /// CiNii Books - https://ci.nii.ac.jp/books/
//    public let books = OpenSearchArticles()
//    /// CiNii Dissertations - https://ci.nii.ac.jp/d/
//    public let dissertations = OpenSearchArticles()

    // MARK: - Types

    /// Empty success handler
    public typealias EmptySuccessHandler = () -> Void

    /// Success handler
    public typealias SuccessHandler<T> = (_ data: T) -> Void

    /// Failure handler
    public typealias FailureHandler = (_ error: Error) -> Void

    private enum API {
        static let opensearchURL = "http://ci.nii.ac.jp/opensearch"
    }

    enum HTTPMethod: String {
        case get = "GET"
    }

    // MARK: - Initializers

    /// Returns a shared instance of CiNiiKit.
    public static let shared = CiNiiKit()

    private init() {
    }
}
