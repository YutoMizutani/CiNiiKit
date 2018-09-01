//
//  OpenSearchArticles.swift
//  CiNiiKit
//
//  Created by Yuto Mizutani on 2018/08/29.
//

import Alamofire

public extension CiNiiKitArticles {

    // MARK: - Search Endpoints

    /**

     Get a result of search articles from CiNii Articles.

     - Parameters:
         - q: Specifies keyword to be searched (necessary when items are not specified; items: title, author, authorId, issn, publisher, affilication, journal, volume, issue, page, references, yearTo).
         - count: Specifies the number of search results per page (optional)
         - lang: Specifies the language the search results are displayed in (optional)
         - start: Start number for the acquired search result list (optional)
         - format: Specifies the format of the response (optional)
         - title: earches by article name.
         - author: Searches by author name.
         - authorId: Searches by author id (NRID).
         - issn: Searches by ISSN.
         - publisher: Searches by publisher name. It is necessary to encode the URL.
         - affiliation: Searches by author affiliation. It is necessary to encode the URL.
         - journal: Searches by journal name. It is necessary to encode the URL.
         - volume: Searches by volume.
         - issue: Searches by issue.
         - page: Searches by page.
         - references: Searches by references. It is necessary to encode the URL.
         - yearFrom: Searches by year of publication (From).
         - yearTo: Searches by year of publication (To).
         - range: Specifies the search target option.
         - sortOrder: Specifies the sorting condition.
         - success:
         - failure:

     - SeeAlso:
     https://support.nii.ac.jp/en/cia/api/a_opensearch
     */
    func search(_ q: String? = nil,
                count: Int? = nil,
                lang: LanguageType? = nil,
                start: Int? = nil,
                format: Int? = nil,
                title: String? = nil,
                author: String? = nil,
                authorId: String? = nil,
                issn: String? = nil,
                publisher: String? = nil,
                affiliation: String? = nil,
                journal: String? = nil,
                volume: Int? = nil,
                page: Int? = nil,
                references: String? = nil,
                yearFrom: Int? = nil,
                yearTo: Int? = nil,
                range: Int? = nil,
                sortOrder: SortOrderType.Search? = nil,
                success: CiNiiKit.SuccessHandler<ArticlesModel>?,
                failure: CiNiiKit.FailureHandler?) throws {
        let oprionalParams: [Any?] = [q, title, author, authorId, issn, publisher, affiliation, journal, volume, page, references, yearFrom, yearTo]
        guard !oprionalParams.filter({ $0 != nil }).isEmpty else {
            throw QueryError.noSpecifiedKeywordError
        }

        var parameters: Parameters = Parameters()
        parameters["q"] ?= q
        parameters["count"] ?= count
        parameters["lang"] ?= lang?.rawValue
        parameters["start"] ?= start
        parameters["format"] ?= format
        parameters["title"] ?= title
        parameters["author"] ?= author
        parameters["authorid"] ?= authorId
        parameters["issn"] ?= issn
        parameters["publisher"] ?= publisher
        parameters["affiliation"] ?= affiliation
        parameters["journal"] ?= journal
        parameters["volume"] ?= volume
        parameters["page"] ?= page
        parameters["references"] ?= references
        parameters["year_from"] ?= yearFrom
        parameters["year_to"] ?= yearTo
        parameters["range"] ?= range
        parameters["sortorder"] ?= sortOrder?.rawValue

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

     Get a result of search articles from CiNii Articles.

     - Parameters:
         - keyword: Specifies keyword to be searched.
         - count: Specifies the number of search results per page (optional)
         - lang: Specifies the language the search results are displayed in (optional)
         - start: Start number for the acquired search result list (optional)
         - format: Specifies the format of the response (optional)
         - title: earches by article name.
         - author: Searches by author name.
         - authorId: Searches by author id (NRID).
         - issn: Searches by ISSN.
         - publisher: Searches by publisher name. It is necessary to encode the URL.
         - affiliation: Searches by author affiliation. It is necessary to encode the URL.
         - journal: Searches by journal name. It is necessary to encode the URL.
         - volume: Searches by volume.
         - issue: Searches by issue.
         - page: Searches by page.
         - references: Searches by references. It is necessary to encode the URL.
         - yearFrom: Searches by year of publication (From).
         - yearTo: Searches by year of publication (To).
         - range: Specifies the search target option.
         - sortOrder: Specifies the sorting condition.
         - success:
         - failure:

     - SeeAlso:
     https://support.nii.ac.jp/en/cia/api/a_opensearch
     */
    func search(keyword q: String,
                count: Int? = nil,
                lang: LanguageType? = nil,
                start: Int? = nil,
                format: Int? = nil,
                title: String? = nil,
                author: String? = nil,
                authorId: String? = nil,
                issn: String? = nil,
                publisher: String? = nil,
                affiliation: String? = nil,
                journal: String? = nil,
                volume: Int? = nil,
                page: Int? = nil,
                references: String? = nil,
                yearFrom: Int? = nil,
                yearTo: Int? = nil,
                range: Int? = nil,
                sortOrder: SortOrderType.Search? = nil,
                success: CiNiiKit.SuccessHandler<ArticlesModel>?,
                failure: CiNiiKit.FailureHandler?) {
        try? self.search(q,
                         count: count,
                         lang: lang,
                         start: start,
                         format: format,
                         title: title,
                         author: author,
                         authorId: authorId,
                         issn: issn,
                         publisher: publisher,
                         affiliation: affiliation,
                         journal: journal,
                         volume: volume,
                         page: page,
                         references: references,
                         yearFrom: yearFrom,
                         yearTo: yearTo,
                         range: range,
                         sortOrder: sortOrder,
                         success: success,
                         failure: failure)
    }

    /**

     Get a result of search authors from CiNii Articles.

     - Parameters:
         - author: Specifies keyword to be searched.
         - count: Specifies the number of search results per page (optional)
         - lang: Specifies the language the search results are displayed in (optional)
         - start: Start number for the acquired search result list (optional)
         - format: Specifies the format of the response (optional)
         - sortOrder: Specifies the sorting condition.
         - success:
         - failure:

     - SeeAlso:
      https://support.nii.ac.jp/en/cia/api/a_opensearch_auth
     */
    func author(author q: String,
                count: Int? = nil,
                lang: LanguageType? = nil,
                start: Int? = nil,
                format: Int? = nil,
                sortOrder: SortOrderType.Author? = nil,
                success: CiNiiKit.SuccessHandler<ArticlesModel>?,
                failure: CiNiiKit.FailureHandler?) {

        var parameters: Parameters = Parameters()
        parameters["q"] = q
        parameters["count"] ?= count
        parameters["lang"] ?= lang?.rawValue
        parameters["start"] ?= start
        parameters["format"] ?= format
        parameters["sortorder"] ?= sortOrder?.rawValue

        try? CiNiiKit.shared.request(API.Articles.OpenSearch.author,
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

     Get a result of search full text from CiNii Articles.

     - Parameters:
         - keyword: Specifies keyword to be searched.
         - count: Specifies the number of search results per page (optional)
         - lang: Specifies the language the search results are displayed in (optional)
         - start: Start number for the acquired search result list (optional)
         - format: Specifies the format of the response (optional)
         - sortOrder: Specifies the sorting condition.
         - success:
         - failure:

     - SeeAlso:
     https://support.nii.ac.jp/en/cia/api/a_opensearch_full
     */
    func fulltext(keyword q: String,
                  count: Int? = nil,
                  lang: LanguageType? = nil,
                  start: Int? = nil,
                  format: Int? = nil,
                  sortOrder: SortOrderType.FullText? = nil,
                  success: CiNiiKit.SuccessHandler<ArticlesModel>?,
                  failure: CiNiiKit.FailureHandler?) {

        var parameters: Parameters = Parameters()
        parameters["q"] = q
        parameters["count"] ?= count
        parameters["lang"] ?= lang?.rawValue
        parameters["start"] ?= start
        parameters["format"] ?= format
        parameters["sortorder"] ?= sortOrder?.rawValue

        try? CiNiiKit.shared.request(API.Articles.OpenSearch.fullText,
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
}
