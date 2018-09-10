//
//  ErrorHandring.swift
//  CiNiiKit
//
//  Created by Yuto Mizutani on 2018/08/29.
//

import Foundation

/// Error about query parameters
public enum QueryError: Error {
    /// Not included specified keyword
    case noSpecifiedKeywordError
}

/// Error about query parameters
public enum PagenationError: Error {
    /// Could not move to previous page
    case minPage
    /// Could not move to next page
    case maxPage
}
