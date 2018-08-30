//
//  OpenSearchArticles.swift
//  CiNiiKit
//
//  Created by Yuto Mizutani on 2018/08/29.
//

import Alamofire
import Foundation

public extension CiNiiKitArticles {

    // MARK: - User Endpoints

    /**

     https://support.nii.ac.jp/en/cia/api/a_opensearch

     - Parameters:
        - keyword: Specifies keyword to be searched (necessary when items are not specified; items: title, author, authorid, issn, publisher, affilication, journal, volume, issue, page, references, year_to).
         - count: Specifies the number of search results per page (optional)
         - lang: Specifies the language the search results are displayed in (optional)
         - start: Start number for the acquired search result list (optional)
         - format: Specifies the format of the response (optional)
         - title: earches by article name.
         - author: Searches by author name.
         - authorid: Searches by author id (NRID).
         - issn: Searches by ISSN.
         - publisher: Searches by publisher name. It is necessary to encode the URL.
         - affiliation: Searches by author affiliation. It is necessary to encode the URL.
         - journal: Searches by journal name. It is necessary to encode the URL.
         - volume: Searches by volume.
         - issue: Searches by issue.
         - page: Searches by page.
         - references: Searches by references. It is necessary to encode the URL.
         - year_from: Searches by year of publication (From).
         - year_to: Searches by year of publication (To).
         - range: Specifies the search target option.
         - sortorder: Specifies the sorting condition.
         - success:
         - failure:
     */
    func search(_ q: String?,
                count: Int? = nil,
                lang: LanguageType? = nil,
                start: Int? = nil,
                format: Int? = nil,
                title: String? = nil,
                author: String? = nil,
                authorid: String? = nil,
                issn: String? = nil,
                publisher: String? = nil,
                affiliation: String? = nil,
                journal: String? = nil,
                volume: Int? = nil,
                page: Int? = nil,
                references: String? = nil,
                year_from: Int? = nil,
                year_to: Int? = nil,
                range: Int? = nil,
                sortorder: SortOrderType.Search? = nil,
                success: CiNiiKit.SuccessHandler<[Any]>?,
                failure: CiNiiKit.FailureHandler?) throws {
        let oprionalParams: [Any?] = [q, title, author, authorid, issn, publisher, affiliation, journal, volume, page, references, year_from, year_to]
        guard oprionalParams.filter({ $0 != nil }).isEmpty else {
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
        parameters["authorid"] ?= authorid
        parameters["issn"] ?= issn
        parameters["publisher"] ?= publisher
        parameters["affiliation"] ?= affiliation
        parameters["journal"] ?= journal
        parameters["volume"] ?= volume
        parameters["page"] ?= page
        parameters["references"] ?= references
        parameters["year_from"] ?= year_from
        parameters["year_to"] ?= year_to
        parameters["range"] ?= range
        parameters["sortorder"] ?= sortorder?.rawValue

        Alamofire.request(API.Articles.OpenSearch.search, parameters: parameters, encoding: URLEncoding.default)
    }

    /**

     https://support.nii.ac.jp/en/cia/api/a_opensearch

     - Parameters:
         - keyword: Specifies keyword to be searched.
         - count: Specifies the number of search results per page (optional)
         - lang: Specifies the language the search results are displayed in (optional)
         - start: Start number for the acquired search result list (optional)
         - format: Specifies the format of the response (optional)
         - title: earches by article name.
         - author: Searches by author name.
         - authorid: Searches by author id (NRID).
         - issn: Searches by ISSN.
         - publisher: Searches by publisher name. It is necessary to encode the URL.
         - affiliation: Searches by author affiliation. It is necessary to encode the URL.
         - journal: Searches by journal name. It is necessary to encode the URL.
         - volume: Searches by volume.
         - issue: Searches by issue.
         - page: Searches by page.
         - references: Searches by references. It is necessary to encode the URL.
         - year_from: Searches by year of publication (From).
         - year_to: Searches by year of publication (To).
         - range: Specifies the search target option.
         - sortorder: Specifies the sorting condition.
         - success:
         - failure:
     */
    func search(keyword q: String,
                count: Int? = nil,
                lang: LanguageType? = nil,
                start: Int? = nil,
                format: Int? = nil,
                title: String? = nil,
                author: String? = nil,
                authorid: String? = nil,
                issn: String? = nil,
                publisher: String? = nil,
                affiliation: String? = nil,
                journal: String? = nil,
                volume: Int? = nil,
                page: Int? = nil,
                references: String? = nil,
                year_from: Int? = nil,
                year_to: Int? = nil,
                range: Int? = nil,
                sortorder: SortOrderType.Search? = nil,
                success: CiNiiKit.SuccessHandler<[Any]>?,
                failure: CiNiiKit.FailureHandler?) {
        try? self.search(q,
                         count: count,
                         lang: lang,
                         start: start,
                         format: format,
                         title: title,
                         author: author,
                         authorid: authorid,
                         issn: issn,
                         publisher: publisher,
                         affiliation: affiliation,
                         journal: journal,
                         volume: volume,
                         page: page,
                         references: references,
                         year_from: year_from,
                         year_to: year_to,
                         range: range,
                         sortorder: sortorder,
                         success: success,
                         failure: failure)
    }

    /**

     https://support.nii.ac.jp/en/cia/api/a_opensearch_auth

     - Parameters:
         - author: Specifies keyword to be searched.
         - count: Specifies the number of search results per page (optional)
         - lang: Specifies the language the search results are displayed in (optional)
         - start: Start number for the acquired search result list (optional)
         - format: Specifies the format of the response (optional)
         - sortorder: Specifies the sorting condition.
         - success:
         - failure:
     */
    func author(author q: String,
                count: Int? = nil,
                lang: LanguageType? = nil,
                start: Int? = nil,
                format: Int? = nil,
                sortorder: SortOrderType.Author? = nil,
                success: CiNiiKit.SuccessHandler<[Any]>?,
                failure: CiNiiKit.FailureHandler?) {

        var parameters: Parameters = Parameters()
        parameters["q"] = q
        parameters["count"] ?= count
        parameters["lang"] ?= lang?.rawValue
        parameters["start"] ?= start
        parameters["format"] ?= format
        parameters["sortorder"] ?= sortorder?.rawValue

        Alamofire.request(API.Articles.OpenSearch.author, parameters: parameters, encoding: URLEncoding.default)
    }

    /**

     https://support.nii.ac.jp/en/cia/api/a_opensearch_full

     - Parameters:
         - keyword: Specifies keyword to be searched.
         - count: Specifies the number of search results per page (optional)
         - lang: Specifies the language the search results are displayed in (optional)
         - start: Start number for the acquired search result list (optional)
         - format: Specifies the format of the response (optional)
         - sortorder: Specifies the sorting condition.
         - success:
         - failure:
     */
    func fulltext(keyword q: String,
                  count: Int? = nil,
                  lang: LanguageType? = nil,
                  start: Int? = nil,
                  format: Int? = nil,
                  sortorder: SortOrderType.FullText? = nil,
                  success: CiNiiKit.SuccessHandler<[Any]>?,
                  failure: CiNiiKit.FailureHandler?) {

        var parameters: Parameters = Parameters()
        parameters["q"] = q
        parameters["count"] ?= count
        parameters["lang"] ?= lang?.rawValue
        parameters["start"] ?= start
        parameters["format"] ?= format
        parameters["sortorder"] ?= sortorder?.rawValue

        Alamofire.request(API.Articles.OpenSearch.fullText, parameters: parameters, encoding: URLEncoding.default)
    }
}
