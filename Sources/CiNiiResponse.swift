//
//  CiNiiResponse.swift
//  CiNiiKit
//
//  Created by Yuto Mizutani on 2018/08/27.
//

struct CiNiiResponse<T: Decodable>: Decodable {

    // MARK: - Properties

    let data: T?
    let meta: Meta
    let pagination: Pagination?

    // MARK: - Types

    struct Meta: Decodable {
        let code: Int
        let errorType: String?
        let errorMessage: String?
    }

    struct Pagination: Decodable {
        let nextUrl: String?
        let nextMaxId: String?
    }
}

public struct CiNiiEmptyResponse: Decodable { }
