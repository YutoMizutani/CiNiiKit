//
//  OpenSearchArticles.swift
//  CiNiiKit
//
//  Created by Yuto Mizutani on 2018/08/29.
//

import Foundation

public extension CiNiiKitArticles {

    // MARK: - User Endpoints

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
    }
}
