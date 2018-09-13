//
//  OpenSearchPageableModel.swift
//  CiNiiKit
//
//  Created by Yuto Mizutani on 2018/09/10.
//

import Alamofire

/// Paging feature protocol
public protocol OpenSearchPageable {
    /// Requested URI
    var id: String { get }
    /// Current page
    var page: Int? { get }
    /// Total search results
    var totalResults: Int? { get }
    /// Start number
    var startIndex: Int? { get }
    /// Results per page
    var itemsPerPage: Int? { get }
}

public extension OpenSearchPageable {
    /// Get query parameter
    fileprivate func getParameter(_ key: String) -> String? {
        return self.id.split(separator: "&").reversed().map { String($0) }.first(where: { $0.hasPrefix("\(key)=") })
    }

    /**
     Request parameters from model

     - REMARK:
     e.g. https://ci.nii.ac.jp/opensearch/search?appid=&format=json&q=%E8%A1%8C%E5%8B%95%E5%88%86%E6%9E%90
     -> (url: https://ci.nii.ac.jp/opensearch/search, parameters: ["appid" : "", "format" : "json", "q" : "%E8%A1%8C%E5%8B%95%E5%88%86%E6%9E%90"])
     */
    var requestParameters: (detail: (url: String, parameters: Parameters), isReachEnd: Bool) {
        let id: String = self.id
        let isReachEnd: Bool
        let url: String
        var parameters: Parameters = Parameters()

        parameters["count"] ?= String(self.itemsPerPage)
        parameters["start"] ?= String(self.page)

        if let urlIndex: Range<String.Index> = id.range(of: "?") {
            url = String(id[id.startIndex..<urlIndex.lowerBound])
            let rawParameters: String = String(id[urlIndex.upperBound..<id.endIndex])
            rawParameters.split(separator: "&").forEach {
                let splittedParam = $0.split(separator: "=").map { String($0) }
                let param: (key: String, value: String) = (splittedParam[0], splittedParam[1])
                parameters[param.key] = param.value
            }
        } else {
            url = id
        }

        if let page = self.page,
            let totalResults = self.totalResults,
            let startIndex = self.startIndex,
            let itemsPerPage = self.itemsPerPage {
            isReachEnd = itemsPerPage * (startIndex == 0 ? page + 1 : startIndex) > totalResults
        } else {
            isReachEnd = false
        }

        return (detail: (url: url, parameters: parameters), isReachEnd: isReachEnd)
    }
}

extension ArticlesModel: OpenSearchPageable {
    /// Current page
    public var page: Int? {
        return Int(self.getParameter("start"))
    }

    /// Total search results
    public var totalResults: Int? {
        return Int(self.graph[0].opensearchTotalResults)
    }

    /// Start number
    public var startIndex: Int? {
        return Int(self.graph[0].opensearchStartIndex)
    }

    /// Results per page
    public var itemsPerPage: Int? {
        return Int(self.graph[0].opensearchItemsPerPage)
    }
}

extension BooksModel: OpenSearchPageable {
    /// Current page
    public var page: Int? {
        return Int(self.getParameter("start"))
    }

    /// Total search results
    public var totalResults: Int? {
        return Int(self.graph[0].opensearchTotalResults)
    }

    /// Start number
    public var startIndex: Int? {
        return Int(self.graph[0].opensearchStartIndex)
    }

    /// Results per page
    public var itemsPerPage: Int? {
        return Int(self.graph[0].opensearchItemsPerPage)
    }
}

extension DissertationsModel: OpenSearchPageable {
    /// Current page
    public var page: Int? {
        return Int(self.getParameter("start"))
    }

    /// Total search results
    public var totalResults: Int? {
        return Int(self.graph[0].opensearchTotalResults)
    }

    /// Start number
    public var startIndex: Int? {
        return Int(self.graph[0].opensearchStartIndex)
    }

    /// Results per page
    public var itemsPerPage: Int? {
        return Int(self.graph[0].opensearchItemsPerPage)
    }
}
