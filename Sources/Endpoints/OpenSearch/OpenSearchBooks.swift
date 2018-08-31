//
//  OpenSearchBooks.swift
//  CiNiiKit
//
//  Created by Yuto Mizutani on 2018/08/31.
//

import Alamofire

public extension CiNiiKitBooks {

    // MARK: - Search Endpoints

    /**

     Get a result of search books from CiNii Books.

     - Parameters:
         - q: Free Keyword
         - title: Title
         - title_exact: Title exact match search flag; True is needed for title exact match search.
         - include_utl: Uniform title search flag; True is needed for Uniform title exact match search.
         - author: Author name
         - include_alias: Alias name of author search flag; True is needed for Author name search included Alias name.
         - publisher: Publisher
         - subject: Subject
         - note: Note
         - authorid: Author ID
         - utid: Unification title ID
         - isbn: ISBN; Without hyphen. Both 10 digits and 13 digits can be searched.
         - issn: ISSN; Without hyphen.
         - ncid: NCID
         - clas: Classification; It is possible to perform a prefix search by putting an asterisk (*) after the search terms.
         - gmd: General Material Designation; Specify the Language code. Refer to [the General Material Designation code table](http://catdoc.nii.ac.jp/MAN2/CM/furoku1_1.html). However, to search materials without a code (Book and Journal) need to be specified one character of underscore.
         - lang: Language; Specify the Language code. Refer to [the Language code table](http://catdoc.nii.ac.jp/MAN2/CM/furoku1_3.html).
         - fano: Library ID
         - kid: Organization ID
         - area: Area
         - year_from: Publication year(from); Western year including the specified year.
         - year_to: Publication year(to); Western year including the specified year.
         - type: Material type
         - sortorder: Sort Order
         - p: Search Page Number
         - count: Number of outcome per one page
         - success:
         - failure:

     - SeeAlso:
     https://support.nii.ac.jp/en/cib/api/b_opensearch
     */
    func search(_ q: String? = nil,
                title: String? = nil,
                titleExact: Bool? = nil,
                includeUtl: Bool? = nil,
                author: String? = nil,
                includeAlias: Bool? = nil,
                publisher: String? = nil,
                subject: String? = nil,
                note: String? = nil,
                authorId: String? = nil,
                utid: String? = nil,
                isbn: String? = nil,
                issn: String? = nil,
                ncid: String? = nil,
                clas: String? = nil,
                gmd: String? = nil,
                lang: String? = nil,
                fano: String? = nil,
                kid: String? = nil,
                area: String? = nil,
                yearFrom: String? = nil,
                yearTo: String? = nil,
                type: MaterialType? = nil,
                sortorder: SortOrderType? = nil,
                p: Int? = nil,
                count: Int? = nil,
                success: CiNiiKit.SuccessHandler<ArticlesModel>?,
                failure: CiNiiKit.FailureHandler?) throws {
        let oprionalParams: [Any?] = [q,
                                      title,
                                      titleExact,
                                      includeUtl,
                                      author,
                                      includeAlias,
                                      publisher,
                                      subject,
                                      note,
                                      authorId,
                                      utid,
                                      isbn,
                                      issn,
                                      ncid,
                                      clas,
                                      gmd,
                                      lang,
                                      fano,
                                      kid,
                                      area,
                                      yearFrom,
                                      yearTo
                                    ]
        guard !oprionalParams.filter({ $0 != nil }).isEmpty else {
            throw QueryError.noSpecifiedKeywordError
        }

        var parameters: Parameters = Parameters()
        parameters["q"] ?= q
        parameters["title"] ?= title
        parameters["title_exact"] ?= titleExact
        parameters["include_utl"] ?= includeUtl
        parameters["author"] ?= author
        parameters["include_alias"] ?= includeAlias
        parameters["publisher"] ?= publisher
        parameters["subject"] ?= subject
        parameters["note"] ?= note
        parameters["authorid"] ?= authorId
        parameters["utid"] ?= utid
        parameters["isbn"] ?= isbn
        parameters["issn"] ?= issn
        parameters["ncid"] ?= ncid
        parameters["clas"] ?= clas
        parameters["gmd"] ?= gmd
        parameters["lang"] ?= lang
        parameters["fano"] ?= fano
        parameters["kid"] ?= kid
        parameters["area"] ?= area
        parameters["year_from"] ?= yearFrom
        parameters["year_to"] ?= yearTo
        parameters["type"] ?= type?.rawValue
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

     Get a result of search books from CiNii Books.

     - Parameters:
         - keyword: Free Keyword
         - title: Title
         - title_exact: Title exact match search flag; True is needed for title exact match search.
         - include_utl: Uniform title search flag; True is needed for Uniform title exact match search.
         - author: Author name
         - include_alias: Alias name of author search flag; True is needed for Author name search included Alias name.
         - publisher: Publisher
         - subject: Subject
         - note: Note
         - authorid: Author ID
         - utid: Unification title ID
         - isbn: ISBN; Without hyphen. Both 10 digits and 13 digits can be searched.
         - issn: ISSN; Without hyphen.
         - ncid: NCID
         - clas: Classification; It is possible to perform a prefix search by putting an asterisk (*) after the search terms.
         - gmd: General Material Designation; Specify the Language code. Refer to [the General Material Designation code table](http://catdoc.nii.ac.jp/MAN2/CM/furoku1_1.html). However, to search materials without a code (Book and Journal) need to be specified one character of underscore.
         - lang: Language; Specify the Language code. Refer to [the Language code table](http://catdoc.nii.ac.jp/MAN2/CM/furoku1_3.html).
         - fano: Library ID
         - kid: Organization ID
         - area: Area
         - year_from: Publication year(from); Western year including the specified year.
         - year_to: Publication year(to); Western year including the specified year.
         - type: Material type
         - sortorder: Sort Order
         - p: Search Page Number
         - count: Number of outcome per one page
         - success:
         - failure:

     - SeeAlso:
     https://support.nii.ac.jp/en/cib/api/b_opensearch
     */
    func search(keyword q: String,
                title: String? = nil,
                titleExact: Bool? = nil,
                includeUtl: Bool? = nil,
                author: String? = nil,
                includeAlias: Bool? = nil,
                publisher: String? = nil,
                subject: String? = nil,
                note: String? = nil,
                authorId: String? = nil,
                utid: String? = nil,
                isbn: String? = nil,
                issn: String? = nil,
                ncid: String? = nil,
                clas: String? = nil,
                gmd: String? = nil,
                lang: String? = nil,
                fano: String? = nil,
                kid: String? = nil,
                area: String? = nil,
                yearFrom: String? = nil,
                yearTo: String? = nil,
                type: MaterialType? = nil,
                sortorder: SortOrderType? = nil,
                p: Int? = nil,
                count: Int? = nil,
                success: CiNiiKit.SuccessHandler<ArticlesModel>?,
                failure: CiNiiKit.FailureHandler?) {
        try? self.search(q,
                         title: title,
                         titleExact: titleExact,
                         includeUtl: includeUtl,
                         author: author,
                         includeAlias: includeAlias,
                         publisher: publisher,
                         subject: subject,
                         note: note,
                         authorId: authorId,
                         utid: utid,
                         isbn: isbn,
                         issn: issn,
                         ncid: ncid,
                         clas: clas,
                         gmd: gmd,
                         lang: lang,
                         fano: fano,
                         kid: kid,
                         area: area,
                         yearFrom: yearFrom,
                         yearTo: yearTo,
                         type: type,
                         sortorder: sortorder,
                         p: p,
                         count: count,
                         success: success,
                         failure: failure)
    }
}
