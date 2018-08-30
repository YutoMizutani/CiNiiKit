//
//  CiNiiKit.swift
//  CiNiiKit
//
//  Created by Yuto Mizutani on 2018/08/27.
//

import Alamofire
import KeychainAccess
import SwiftyJSON
import UIKit

/// A set of helper functions to make the Instagram API easier to use.
public class CiNiiKit {
    public let text = "Hello, World!"

    /// CiNii Articles - https://ci.nii.ac.jp/
    public let articles = CiNiiKitArticles.shared
    /// CiNii Books - https://ci.nii.ac.jp/books/
    /// CiNii Dissertations - https://ci.nii.ac.jp/d/

    // MARK: - Types

    /// Empty success handler
    public typealias EmptySuccessHandler = () -> Void

    /// Success handler
    public typealias SuccessHandler<T> = (_ data: T) -> Void

    /// Failure handler
    public typealias FailureHandler = (_ error: Error) -> Void

    // MARK: - Initializers

    /// Returns a shared instance of CiNiiKit.
    public static let shared = CiNiiKit()

    private init() {}

    // MARK: - Keychain

    private let accessTokenKey = "accesstoken"
    private var keychain = Keychain(service: "com.ym.cinii-kit")

    public func register(key value: String) {
        self.keychain[self.accessTokenKey] = value
    }

    public func remove() throws {
        try self.keychain.remove(self.accessTokenKey)
    }

    // MARK: - Requests

    func request<T: Decodable>(_ url: String,
                               method: HTTPMethod = .get,
                               parameters: Parameters? = nil,
                               success: ((_ data: T?) -> Void)?,
                               failure: FailureHandler?) throws {

        guard let appid: String = try self.keychain.get(self.accessTokenKey) else {
            throw QueryError.noAppID
        }

        var parameters = parameters ?? Parameters()
        parameters["appid"] = appid

        let headers: HTTPHeaders = HTTPHeaders()

        Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: headers)
            .responseJSON { response in
                guard let object = response.result.value else { return }
                let json = JSON(object)
        }
    }
}
