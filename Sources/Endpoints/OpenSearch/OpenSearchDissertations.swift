//
//  OpenSearchDissertations.swift
//  CiNiiKit
//
//  Created by Yuto Mizutani on 2018/08/31.
//

import Alamofire

public extension CiNiiKitDissertations {

    // MARK: - Search Endpoints

    /**

     Get a result of a search Dissertations from CiNii Dissertations.

     - Parameters:
         - q: Free Keyword
         - title: Free Keyword
         - description: Note and Description
         - author: Author
         - grantor: University
         - grantorid: Grantor ID
         - grantid: Grant ID
         - degreename: Types of degree
         - year_from: Degree year(from); Western year.Only either one is also possible. (Even in that case, dissertation whose publication year is unknown can not be searched.)
         - year_to: Degree year(to); Western year.Only either one is also possible. (Even in that case, dissertation whose publication year is unknown can not be searched.)
         - fulltext: Fulltext
         - range: Range
         - sortorder: Sort Order
         - p: Search Page Number
         - count: Number of outcome per one page
         - success:
         - failure:

     - SeeAlso:
     https://support.nii.ac.jp/en/cid/api/d_opensearch
     */
    func search(_ q: String? = nil,
                title: String? = nil,
                description: String? = nil,
                author: String? = nil,
                grantor: String? = nil,
                grantorid: String? = nil,
                grantid: String? = nil,
                degreename: String? = nil,
                year_from: String? = nil,
                year_to: String? = nil,
                fulltext: String? = nil,
                range: RangeType? = nil,
                sortorder: SortOrderType? = nil,
                p: Int? = nil,
                count: Int? = nil,
                success: CiNiiKit.SuccessHandler<ArticlesModel>?,
                failure: CiNiiKit.FailureHandler?) throws {
        let oprionalParams: [Any?] = [q, title, description, author, grantor, grantorid, grantid, degreename, year_from, year_to, fulltext]
        guard !oprionalParams.filter({ $0 != nil }).isEmpty else {
            throw QueryError.noSpecifiedKeywordError
        }

        var parameters: Parameters = Parameters()
        parameters["q"] ?= q
        parameters["title"] ?= title
        parameters["description"] ?= description
        parameters["author"] ?= author
        parameters["grantor"] ?= grantor
        parameters["grantorid"] ?= grantorid
        parameters["grantid"] ?= grantid
        parameters["degreename"] ?= degreename
        parameters["year_from"] ?= year_from
        parameters["year_to"] ?= year_to
        parameters["fulltext"] ?= fulltext
        parameters["range"] ?= range?.rawValue
        parameters["sortorder"] ?= sortorder?.rawValue
        parameters["p"] ?= p
        parameters["count"] ?= count

        try? CiNiiKit.shared.request(API.Articles.OpenSearch.search,
                                     parameters: parameters,
                                     success: { data in
                                        let decoder: JSONDecoder = JSONDecoder()
                                        guard let model: ArticlesModel = try? decoder.decode(ArticlesModel.self, from: data) else { return }
                                        success?(model)
                                     },
                                     failure: { error in
                                        failure?(error)
                                     })
    }

    /**

     Get a result of a search Dissertations from CiNii Dissertations.

     - Parameters:
         - keyword: Free Keyword
         - title: Free Keyword
         - description: Note and Description
         - author: Author
         - grantor: University
         - grantorid: Grantor ID
         - grantid: Grant ID
         - degreename: Types of degree
         - year_from: Degree year(from); Western year.Only either one is also possible. (Even in that case, dissertation whose publication year is unknown can not be searched.)
         - year_to: Degree year(to); Western year.Only either one is also possible. (Even in that case, dissertation whose publication year is unknown can not be searched.)
         - fulltext: Fulltext
         - range: Range
         - sortorder: Sort Order
         - p: Search Page Number
         - count: Number of outcome per one page
         - success:
         - failure:

     - SeeAlso:
     https://support.nii.ac.jp/en/cid/api/d_opensearch
     */
    func search(keyword q: String,
                title: String? = nil,
                description: String? = nil,
                author: String? = nil,
                grantor: String? = nil,
                grantorid: String? = nil,
                grantid: String? = nil,
                degreename: String? = nil,
                year_from: String? = nil,
                year_to: String? = nil,
                fulltext: String? = nil,
                range: RangeType? = nil,
                sortorder: SortOrderType? = nil,
                p: Int? = nil,
                count: Int? = nil,
                success: CiNiiKit.SuccessHandler<ArticlesModel>?,
                failure: CiNiiKit.FailureHandler?) {
        try? self.search(q,
                         title: title,
                         description: description,
                         author: author,
                         grantor: grantor,
                         grantorid: grantorid,
                         grantid: grantid,
                         degreename: degreename,
                         year_from: year_from,
                         year_to: year_to,
                         fulltext: fulltext,
                         range: range,
                         sortorder: sortorder,
                         p: p,
                         count: count,
                         success: success,
                         failure: failure)
    }
}
