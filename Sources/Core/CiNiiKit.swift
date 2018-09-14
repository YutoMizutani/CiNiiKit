//
//  CiNiiKit.swift
//  CiNiiKit
//
//  Created by Yuto Mizutani on 2018/08/27.
//

import Alamofire

/// A set of helper functions to make the Instagram API easier to use.
public class CiNiiKit {
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

    /// Returns a shared instance of CiNiiKit
    public static let shared = CiNiiKit()

    /// Use of Singleton pattern with private access
    private init() {}

    // MARK: - API key

    /// CiNii API key; See https://support.nii.ac.jp/en/cinii/api/developer if you don't already get the key or want to know more information
    private(set) var appid: String?

    /// Register API key
    public func register(key value: String) {
        self.appid = value
    }

    /// Remove API key
    public func remove() {
        self.appid = nil
    }

    // MARK: - Requests

    /**
     Request

     - Parameters:
         - url: API URL
         - method: HTTP method
         - parameters: Query parameters
         - success: Success handler
         - failure: Failure handler
     */
    func request(_ url: String,
                 method: HTTPMethod = .get,
                 parameters: Parameters? = nil,
                 success: SuccessHandler<Data>?,
                 failure: FailureHandler?) {

        var parameters = parameters ?? Parameters()
        parameters["count"] = parameters["count"] ?? "200"
        parameters["format"] = "json"
        parameters["appid"] = self.appid

        Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.default)
            .responseData { response in
                switch response.result {
                case .success:
                    guard let data = response.data else { return }
                    success?(data)
                case .failure(let error):
                    failure?(error)
                }
            }
    }

    /**
     Pagenation - next page

     - Parameters:
         - pageableModel: paging model
         - success: Success handler
         - failure: Failure handler
     */
    func nextPage(_ pageableModel: OpenSearchPageable,
                  success: SuccessHandler<Data>?,
                  failure: FailureHandler?) {

        guard !pageableModel.requestParameters.isReachEnd else {
            failure?(PagenationError.maxPage)
            return
        }
        let url: String = pageableModel.requestParameters.detail.url
        var parameters: Parameters = pageableModel.requestParameters.detail.parameters
        let currentPage: Int = pageableModel.page ?? 0
        parameters["start"] = "\(currentPage + 1)"

        self.request(url, parameters: parameters, success: success, failure: failure)
    }

    /**
     Pagenation - previous page

     - Parameters:
         - pageableModel: paging model
         - success: Success handler
         - failure: Failure handler
     */
    func previousPage(_ pageableModel: OpenSearchPageable,
                      success: SuccessHandler<Data>?,
                      failure: FailureHandler?) {

        let url: String = pageableModel.requestParameters.detail.url
        var parameters: Parameters = pageableModel.requestParameters.detail.parameters
        let currentPage: Int = pageableModel.page ?? 0
        if let minPage = pageableModel.startIndex, currentPage <= minPage {
            failure?(PagenationError.minPage)
            return
        }
        parameters["start"] = "\(currentPage - 1)"

        self.request(url, parameters: parameters, success: success, failure: failure)
    }
}
