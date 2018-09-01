//
//  ArticlesModel.swift
//  CiNiiKit
//
//  Created by Yuto Mizutani on 2018/08/30.
//

import Foundation

public struct ArticlesModel: Codable {
    /**
     Document route element

     - Remark:
     "@context": {
     "dc": "http://purl.org/dc/elements/1.1/",
     "rdf": "http://www.w3.org/1999/02/22-rdf-syntax-ns#",
     "opensearch": "http://a9.com/-/spec/opensearch/1.1/",
     "rdfs": "http://www.w3.org/2000/01/rdf-schema#",
     "prism": "http://prismstandard.org/namespaces/basic/2.0/",
     "@vocab": "http://purl.org/rss/1.0/"
     },
     */
    let context: Context

    /**
     Requested URI

     - Remark:
     This is a search request URI. URL-encorded query is output with "variable identifier=value" format. "appid" will be removed from parameter.
    */
    let id: String

    /**
     - Remark:
     Element count of array is 1
     */
    let graph: [Graph]

    /**
     CodingKeys

     - Remark:
     It is described by the order of JSON.
     */
    private enum CodingKeys: String, CodingKey {
        case context = "@context"
        case id = "@id"
        case graph = "@graph"
    }

    /// @context Object
    struct Context: Codable {
        /**
         - Remark:
         http://purl.org/rss/1.0/
         */
        let vocab: String

        /**
         - Remark:
         http://purl.org/dc/elements/1.1/
         */
        let dc: String

        /**
         - Remark:
         http://www.w3.org/1999/02/22-rdf-syntax-ns#
         */
        let rdf: String

        /**
         - Remark:
         http://a9.com/-/spec/opensearch/1.1/
         */
        let opensearch: String

        /**
         - Remark:
         http://www.w3.org/2000/01/rdf-schema#
         */
        let rdfs: String

        /**
         - Remark:
         http://prismstandard.org/namespaces/basic/2.0/
         */
        let prism: String

        /**
         CodingKeys

         - Remark:
         It is described by the order of JSON.
         */
        private enum CodingKeys: String, CodingKey {
            case vocab = "@vocab"
            case dc
            case opensearch
            case prism
            case rdf
            case rdfs
        }
    }

    struct Graph: Codable {
        /**
         Requested URI

         - Remark:
         This is a search request URI. URL-encorded query is output with "variable identifier=value" format. "appid" will be removed from parameter.
         */
        let id: String

        /**
         - Remark:
         Fixed: "channel"
         */
        let type: String

        /**
         Title

         - Remark:
         Concatenation with query to "CiNii OpenSearch", Example: "title":"CiNii OpenSearch - 検索エンジン 順位",
         */
        let title: String

        /**
         Title

         - Remark:
         Same as the above
         */
        let description: String

        /**
         Requested URI

         - Remark:
         This is a search request URI. URL-encorded query is output with "variable identifier=value" format. "appid" will be removed from parameter.
         */
        let link: ObjectiveID

        /**
         Date when search was executed

         - Remark:
         W3CDTF format
         */
        let dcDate: String

        /**
         Total search results
         */
        let opensearchTotalResults: String

        /**
         Start number

         - Remark:
         Indicates from which record number among the search results the data is being described.
         */
        let opensearchStartIndex: String?

        /**
         Results per page

         - Remark:
         Indicates how many search results are included in the response.
         */
        let opensearchItemsPerPage: String?

        let items: [Item]?

        /**
         CodingKeys

         - Remark:
         It is described by the order of JSON.
         */
        private enum CodingKeys: String, CodingKey {
            case id = "@id"
            case type = "@type"
            case dcDate = "dc:date"
            case description
            case items
            case title
            case link
            case opensearchItemsPerPage = "opensearch:itemsPerPage"
            case opensearchStartIndex = "opensearch:startIndex"
            case opensearchTotalResults = "opensearch:totalResults"
        }
    }

    /// items Object
    struct Item: Codable {
        /**
         URI of the Bibliography Details Page

         - Remark:
         Permalink to articles in the response.
         */
        let id: String?

        /**
         - Remark:
         Fixed: "item"
         */
        let type: String?

        /**
         Title
         */
        let title: String?

        /**
         URI of Bibliography Details Page

         - Remark:
         Indicates the permalink in Bibliography Details Page.
         "link": {@id:"http://ci.nii.ac.jp/naid/1234567890"},
         */
        let link: ObjectiveID?

        /**
         URI of Bibliography JSON-LD

         - Remark:
         Indicates the URI of Bibliography JSON-LD (except parameter of appid)
         "rdfs:seeAlso":{@id:"http://ci.nii.ac.jp/naid/1234567890.json"},
         */
        let rdfsSeeAlso: ObjectiveID?

        /**
         Author name

         - Remark:
         Repeated if there are multiple items
         */
        let dcCreator: [ObjectiveValue]?

        /**
         Publisher
         */
        let dcPublisher: String?

        /**
         Publication name
         */
        let prismPublicationName: String?

        /**
         Date of publication

         - Remark:
         W3CDTF format
         */
        let prismPublicationDate: String?

        /**
         ISSN
         */
        let prismIssn: String?

        /**
         Volume
         */
        let prismVolume: String?

        /**
         Number
         */
        let prismNumber: String?

        /**
         Start page
         */
        let prismStartingPage: String?

        /**
         End page
         */
        let prismEndingPage: String?

        /**
         Page range
         */
        let prismPageRange: String?

        /**
         Abstract

         - Remark:
         A displayed content is assumed to be that which is displayed when an user is not logged in.
         */
        let description: String?

        /**
         Date of publication

         - Remark:
         The same as prism:publicationDate
         */
        let dcDate: String?

        /**
         CodingKeys

         - Remark:
         It is described by the order of JSON.
         */
        private enum CodingKeys: String, CodingKey {
            case id = "@id"
            case type = "@type"
            case dcCreator = "dc:creator"
            case dcDate = "dc:date"
            case dcPublisher = "dc:publisher"
            case description
            case link
            case prismEndingPage = "prism:endingPage"
            case prismIssn = "prism:issn"
            case prismNumber = "prism:number"
            case prismPageRange = "prism:pageRange"
            case prismPublicationDate = "prism:publicationDate"
            case prismPublicationName = "prism:publicationName"
            case prismStartingPage = "prism:startingPage"
            case prismVolume = "prism:volume"
            case rdfsSeeAlso = "rdfs:seeAlso"
            case title
        }
    }

    /// @id Object
    struct ObjectiveID: Codable {
        /// @id
        let id: String?

        /// CodingKeys
        private enum CodingKeys: String, CodingKey {
            case id = "@id"
        }
    }

    /// @value Object
    struct ObjectiveValue: Codable {
        /// @value
        let value: String?

        /// CodingKeys
        private enum CodingKeys: String, CodingKey {
            case value = "@value"
        }
    }
}
