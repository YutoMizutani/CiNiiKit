//
//  CiNiiKit.swift
//  CiNiiKit
//
//  Created by Yuto Mizutani on 2018/08/27.
//

import Alamofire
//import KeychainAccess
import UIKit

/// A set of helper functions to make the Instagram API easier to use.
public class CiNiiKit {
    public let text = "Hello, World!"

    /// CiNii Articles - https://ci.nii.ac.jp/
    public let articles = CiNiiKitArticles.shared
    /// CiNii Books - https://ci.nii.ac.jp/books/
    public let books = CiNiiKitBooks.shared
    /// CiNii Dissertations - https://ci.nii.ac.jp/d/
    public let dissertations = CiNiiKitDissertations.shared

    // MARK: - Types

    /// Empty success handler
    public typealias EmptySuccessHandler = () -> Void

    /// Success handler
    public typealias SuccessHandler<T> = (_ model: T) -> Void

    /// Failure handler
    public typealias FailureHandler = (_ error: Error) -> Void

    // MARK: - Initializers

    /// Returns a shared instance of CiNiiKit.
    public static let shared = CiNiiKit()

    private init() {}

    // MARK: - Keychain

    private let accessTokenKey = "accesstoken"
//    private var keychain = Keychain(service: "com.ym.cinii-kit")
    private(set) var appid: String?

//    public func register(key value: String) {
//        self.keychain[self.accessTokenKey] = value
//    }
//
//    public func remove() throws {
//        try self.keychain.remove(self.accessTokenKey)
//    }

    public func register(key value: String) {
        self.appid = value
    }

    public func remove() {
        self.appid = nil
    }

    // MARK: - Requests

    func request(_ url: String,
                 method: HTTPMethod = .get,
                 parameters: Parameters? = nil,
                 success: ((_ data: Data) -> Void)?,
                 failure: FailureHandler?) throws {

//        guard let appid: String = try self.keychain.get(self.accessTokenKey) else {
//            throw QueryError.noAppID
//        }

        guard let appid: String = appid else {
            throw QueryError.noAppID
        }

        var parameters = parameters ?? Parameters()
        parameters["format"] = "json"
        parameters["appid"] = appid

        Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.default)
            .response { response in
                guard let data = response.data else { return }
                success?(data)
            }
    }
}
