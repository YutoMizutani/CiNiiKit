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
         - sortOrder: Sort Order
         - p: Search Page Number
         - count: Number of outcome per one page
         - success: Success handler
         - failure: Failure handler

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
                sortOrder: SortOrderType.Search? = nil,
                p: Int? = nil,
                count: Int? = nil,
                success: CiNiiKit.SuccessHandler<BooksModel>?,
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
        parameters["sortorder"] ?= sortOrder?.rawValue
        parameters["p"] ?= p
        parameters["count"] ?= count

        CiNiiKit.shared.request(API.Books.OpenSearch.search,
                                parameters: parameters,
                                success: { data in
                                    let decoder: JSONDecoder = JSONDecoder()
                                    guard let model: BooksModel = try? decoder.decode(BooksModel.self, from: data) else { return }
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
         - sortOrder: Sort Order
         - p: Search Page Number
         - count: Number of outcome per one page
         - success: Success handler
         - failure: Failure handler

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
                sortOrder: SortOrderType.Search? = nil,
                p: Int? = nil,
                count: Int? = nil,
                success: CiNiiKit.SuccessHandler<BooksModel>?,
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
                         sortOrder: sortOrder,
                         p: p,
                         count: count,
                         success: success,
                         failure: failure)
    }

    /**

     Get a result of search for authors from CiNii Books.

     - Parameters:
         - name: Author Name; Partial match or exact match of Author Name ID.
         - sortOrder: Sort Order
         - p: Search Page Number
         - count: Number of outcome per one page
         - success: Success handler
         - failure: Failure handler

     - SeeAlso:
     https://support.nii.ac.jp/en/cib/api/b_opensearch_lib
     */
    func author(name: String,
                sortOrder: SortOrderType.Author? = nil,
                p: Int? = nil,
                count: Int? = nil,
                success: CiNiiKit.SuccessHandler<BooksModel>?,
                failure: CiNiiKit.FailureHandler?) {

        var parameters: Parameters = Parameters()
        parameters["name"] ?= name
        parameters["sortorder"] ?= sortOrder?.rawValue
        parameters["p"] ?= p
        parameters["count"] ?= count

        CiNiiKit.shared.request(API.Books.OpenSearch.search,
                                parameters: parameters,
                                success: { data in
                                    let decoder: JSONDecoder = JSONDecoder()
                                    guard let model: BooksModel = try? decoder.decode(BooksModel.self, from: data) else { return }
                                    success?(model)
                                },
                                failure: { error in
                                    failure?(error)
                                })
    }

    /**

     Get a result of search for libraries from CiNii Books.

     - Parameters:
         - name: Library name; Partial match or exact match of Library ID.
         - sortOrder: Sort Order
         - p: Page Number
         - count: Number of outcome per one page
         - success: Success handler
         - failure: Failure handler

     - SeeAlso:
     https://support.nii.ac.jp/en/cib/api/b_opensearch_lib
     */
    func library(name: String,
                 sortOrder: SortOrderType.Library? = nil,
                 p: Int? = nil,
                 count: Int? = nil,
                 success: CiNiiKit.SuccessHandler<BooksModel>?,
                 failure: CiNiiKit.FailureHandler?) {

        var parameters: Parameters = Parameters()
        parameters["name"] ?= name
        parameters["sortorder"] ?= sortOrder?.rawValue
        parameters["p"] ?= p
        parameters["count"] ?= count

        CiNiiKit.shared.request(API.Books.OpenSearch.search,
                                parameters: parameters,
                                success: { data in
                                    let decoder: JSONDecoder = JSONDecoder()
                                    guard let model: BooksModel = try? decoder.decode(BooksModel.self, from: data) else { return }
                                    success?(model)
                                },
                                failure: { error in
                                    failure?(error)
                                })
    }

    /**

     Get a result of search for holdings from CiNii Books.

     - Parameters:
         - ncid: NCID
         - ill: Library - ILL Membership
         - illStat: Library - ILL Status
         - illCopys: Library - Copy Service Status
         - illLoans: Library - Loan Service Status
         - illFaxs: Library - FAX Service Status
         - illOclc: Library - Membership of Japan and US ILL
         - illKeris: Library - Membership of Japan and Korea ILL
         - illOffset: Library - Membership of ILL Offset
         - fano: Library - Library ID
         - year: Journal Holding - Year
         - vol: Journal Holding - Volume
         - issue: Journal Holding - Number
         - cont: Journal Holding - Continuing
         - success: Success handler
         - failure: Failure handler

     - SeeAlso:
     https://support.nii.ac.jp/en/cib/api/b_opensearch_lib
     */
    func holding(ncid: String,
                 ill: ParticipantType? = nil,
                 illStat: ILLStatusType? = nil,
                 illCopys: ServiceStatusType? = nil,
                 illLoans: ServiceStatusType? = nil,
                 illFaxs: ServiceStatusType? = nil,
                 illOclc: ParticipantType? = nil,
                 illKeris: ParticipantType? = nil,
                 illOffset: ParticipantType? = nil,
                 fano: String? = nil,
                 year: String? = nil,
                 vol: String? = nil,
                 issue: String? = nil,
                 cont: Bool? = nil,
                 success: CiNiiKit.SuccessHandler<BooksModel>?,
                 failure: CiNiiKit.FailureHandler?) {

        var parameters: Parameters = Parameters()
        parameters["ncid"] ?= ncid
        parameters["ill"] ?= ill?.rawValue
        parameters["ill_stat"] ?= illStat?.rawValue
        parameters["ill_copys"] ?= illCopys?.rawValue
        parameters["ill_loans"] ?= illLoans?.rawValue
        parameters["ill_faxs"] ?= illFaxs?.rawValue
        parameters["ill_oclc"] ?= illOclc?.rawValue
        parameters["ill_keris"] ?= illKeris?.rawValue
        parameters["ill_offset"] ?= illOffset?.rawValue
        parameters["fano"] ?= fano
        parameters["year"] ?= year
        parameters["vol"] ?= vol
        parameters["issue"] ?= issue
        parameters["cont"] = cont != nil ? cont! ? 0 : 1 : nil

        CiNiiKit.shared.request(API.Books.OpenSearch.search,
                                parameters: parameters,
                                success: { data in
                                    let decoder: JSONDecoder = JSONDecoder()
                                    guard let model: BooksModel = try? decoder.decode(BooksModel.self, from: data) else { return }
                                    success?(model)
                                },
                                failure: { error in
                                    failure?(error)
                                })
    }

    /**
     Pagenation - next page

     - Parameters:
         - model: Response model
         - success: Success handler
         - failure: Failure handler
     */
    func nextPage(_ model: BooksModel,
                  success: CiNiiKit.SuccessHandler<BooksModel>?,
                  failure: CiNiiKit.FailureHandler?) {

        CiNiiKit.shared.nextPage(model,
                                 success: { data in
                                     let decoder: JSONDecoder = JSONDecoder()
                                     guard let model: BooksModel = try? decoder.decode(BooksModel.self, from: data) else { return }
                                     success?(model)
                                 },
                                 failure: { error in
                                     failure?(error)
                                 })
    }

    /**
     Pagenation - previous page

     - Parameters:
         - model: Response model
         - success: Success handler
         - failure: Failure handler
     */
    func previousPage(_ model: BooksModel,
                      success: CiNiiKit.SuccessHandler<BooksModel>?,
                      failure: CiNiiKit.FailureHandler?) {

        CiNiiKit.shared.previousPage(model,
                                     success: { data in
                                         let decoder: JSONDecoder = JSONDecoder()
                                         guard let model: BooksModel = try? decoder.decode(BooksModel.self, from: data) else { return }
                                         success?(model)
                                     },
                                     failure: { error in
                                         failure?(error)
                                     })
    }
}
