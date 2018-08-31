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
         - grantorId: Grantor ID
         - grantId: Grant ID
         - degreeName: Types of degree
         - yearFrom: Degree year(from); Western year.Only either one is also possible. (Even in that case, dissertation whose publication year is unknown can not be searched.)
         - yearTo: Degree year(to); Western year.Only either one is also possible. (Even in that case, dissertation whose publication year is unknown can not be searched.)
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
                grantorId: String? = nil,
                grantId: String? = nil,
                degreeName: String? = nil,
                yearFrom: String? = nil,
                yearTo: String? = nil,
                fulltext: String? = nil,
                range: RangeType? = nil,
                sortorder: SortOrderType? = nil,
                p: Int? = nil,
                count: Int? = nil,
                success: CiNiiKit.SuccessHandler<ArticlesModel>?,
                failure: CiNiiKit.FailureHandler?) throws {
        let oprionalParams: [Any?] = [q, title, description, author, grantor, grantorId, grantId, degreeName, yearFrom, yearTo, fulltext]
        guard !oprionalParams.filter({ $0 != nil }).isEmpty else {
            throw QueryError.noSpecifiedKeywordError
        }

        var parameters: Parameters = Parameters()
        parameters["q"] ?= q
        parameters["title"] ?= title
        parameters["description"] ?= description
        parameters["author"] ?= author
        parameters["grantor"] ?= grantor
        parameters["grantorid"] ?= grantorId
        parameters["grantid"] ?= grantId
        parameters["degreename"] ?= degreeName
        parameters["year_from"] ?= yearFrom
        parameters["year_to"] ?= yearTo
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
         - grantorId: Grantor ID
         - grantId: Grant ID
         - degreeName: Types of degree
         - yearFrom: Degree year(from); Western year.Only either one is also possible. (Even in that case, dissertation whose publication year is unknown can not be searched.)
         - yearTo: Degree year(to); Western year.Only either one is also possible. (Even in that case, dissertation whose publication year is unknown can not be searched.)
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
                grantorId: String? = nil,
                grantId: String? = nil,
                degreeName: String? = nil,
                yearFrom: String? = nil,
                yearTo: String? = nil,
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
                         grantorId: grantorId,
                         grantId: grantId,
                         degreeName: degreeName,
                         yearFrom: yearFrom,
                         yearTo: yearTo,
                         fulltext: fulltext,
                         range: range,
                         sortorder: sortorder,
                         p: p,
                         count: count,
                         success: success,
                         failure: failure)
    }
}
