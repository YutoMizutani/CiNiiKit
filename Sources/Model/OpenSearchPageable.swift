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
    /// Total search results
    var opensearchTotalResults: String { get }
    /// Start number
    var opensearchStartIndex: String? { get }
    /// Results per page
    var opensearchItemsPerPage: String? { get }
}

public extension OpenSearchPageable {
    /**
     Request parameters from model

     - REMARK:
     e.g. https://ci.nii.ac.jp/opensearch/search?appid=&format=json&q=%E8%A1%8C%E5%8B%95%E5%88%86%E6%9E%90
     -> (url: https://ci.nii.ac.jp/opensearch/search, parameters: ["appid" : "", "format" : "json", "q" : "%E8%A1%8C%E5%8B%95%E5%88%86%E6%9E%90"])
     */
    var requestParameters: (detail: (url: String, parameters: Parameters), isReachEnd: Bool) {
        let id: String = self.id
        var url: String
        var parameters: Parameters = Parameters()
        let isReachEnd: Bool
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
        parameters["count"] ?= self.opensearchItemsPerPage
        parameters["start"] ?= self.opensearchStartIndex
        isReachEnd = Int(self.opensearchTotalResults) != nil
            ? (Int(self.opensearchItemsPerPage ?? "1") ?? 1) * (Int(self.opensearchStartIndex ?? "1") ?? 1) > Int(self.opensearchTotalResults)!
            : false
        return (detail: (url: url, parameters: parameters), isReachEnd: isReachEnd)
    }
}

extension ArticlesModel: OpenSearchPageable {
    /// Total search results
    public var opensearchTotalResults: String {
        return self.graph[0].opensearchTotalResults
    }

    /// Start number
    public var opensearchStartIndex: String? {
        return self.graph[0].opensearchStartIndex
    }

    /// Results per page
    public var opensearchItemsPerPage: String? {
        return self.graph[0].opensearchItemsPerPage
    }
}

extension BooksModel: OpenSearchPageable {
    /// Total search results
    public var opensearchTotalResults: String {
        return self.graph[0].opensearchTotalResults
    }

    /// Start number
    public var opensearchStartIndex: String? {
        return self.graph[0].opensearchStartIndex
    }

    /// Results per page
    public var opensearchItemsPerPage: String? {
        return self.graph[0].opensearchItemsPerPage
    }
}

extension DissertationsModel: OpenSearchPageable {
    /// Total search results
    public var opensearchTotalResults: String {
        return self.graph[0].opensearchTotalResults
    }

    /// Start number
    public var opensearchStartIndex: String? {
        return self.graph[0].opensearchStartIndex
    }

    /// Results per page
    public var opensearchItemsPerPage: String? {
        return self.graph[0].opensearchItemsPerPage
    }
}
