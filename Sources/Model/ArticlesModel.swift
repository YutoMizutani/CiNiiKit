//
//  ArticlesModel.swift
//  CiNiiKit
//
//  Created by Yuto Mizutani on 2018/08/30.
//

import Foundation

/// Response Model for CiNii Articles
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
    public let context: Context

    /**
     Requested URI

     - Remark:
     This is a search request URI. URL-encorded query is output with "variable identifier=value" format. "appid" will be removed from parameter.
    */
    public let id: String

    /**
     - Remark:
     Element count of array is 1
     */
    public let graph: [Graph]

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
    public struct Context: Codable {
        /**
         - Remark:
         http://purl.org/rss/1.0/
         */
        public let vocab: String

        /**
         - Remark:
         http://purl.org/dc/elements/1.1/
         */
        public let dc: String

        /**
         - Remark:
         http://www.w3.org/1999/02/22-rdf-syntax-ns#
         */
        public let rdf: String

        /**
         - Remark:
         http://a9.com/-/spec/opensearch/1.1/
         */
        public let opensearch: String

        /**
         - Remark:
         http://www.w3.org/2000/01/rdf-schema#
         */
        public let rdfs: String

        /**
         - Remark:
         http://prismstandard.org/namespaces/basic/2.0/
         */
        public let prism: String

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

    public struct Graph: Codable {
        /**
         Requested URI

         - Remark:
         This is a search request URI. URL-encorded query is output with "variable identifier=value" format. "appid" will be removed from parameter.
         */
        public let id: String

        /**
         - Remark:
         Fixed: "channel"
         */
        public let type: String

        /**
         Title

         - Remark:
         Concatenation with query to "CiNii OpenSearch", Example: "title":"CiNii OpenSearch - 検索エンジン 順位",
         */
        public let title: String

        /**
         Title

         - Remark:
         Same as the above
         */
        public let description: String

        /**
         Requested URI

         - Remark:
         This is a search request URI. URL-encorded query is output with "variable identifier=value" format. "appid" will be removed from parameter.
         */
        public let link: ObjectiveID

        /**
         Date when search was executed

         - Remark:
         W3CDTF format
         */
        public let dcDate: String

        /**
         Total search results
         */
        public let opensearchTotalResults: String

        /**
         Start number

         - Remark:
         Indicates from which record number among the search results the data is being described.
         */
        public let opensearchStartIndex: String?

        /**
         Results per page

         - Remark:
         Indicates how many search results are included in the response.
         */
        public let opensearchItemsPerPage: String?

        public let items: [Item]?

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
    public struct Item: Codable {
        /**
         URI of the Bibliography Details Page

         - Remark:
         Permalink to articles in the response.
         */
        public let id: String?

        /**
         - Remark:
         Fixed: "item"
         */
        public let type: String?

        /**
         Title
         */
        public let title: String?

        /**
         URI of Bibliography Details Page

         - Remark:
         Indicates the permalink in Bibliography Details Page.
         "link": {@id:"http://ci.nii.ac.jp/naid/1234567890"},
         */
        public let link: ObjectiveID?

        /**
         URI of Bibliography JSON-LD

         - Remark:
         Indicates the URI of Bibliography JSON-LD (except parameter of appid)
         "rdfs:seeAlso":{@id:"http://ci.nii.ac.jp/naid/1234567890.json"},
         */
        public let rdfsSeeAlso: ObjectiveID?

        /**
         Author name

         - Remark:
         Repeated if there are multiple items
         */
        public let dcCreator: [ObjectiveValue]?

        /**
         Publisher
         */
        public let dcPublisher: String?

        /**
         Publication name
         */
        public let prismPublicationName: String?

        /**
         Date of publication

         - Remark:
         W3CDTF format
         */
        public let prismPublicationDate: String?

        /**
         ISSN
         */
        public let prismIssn: String?

        /**
         Volume
         */
        public let prismVolume: String?

        /**
         Number
         */
        public let prismNumber: String?

        /**
         Start page
         */
        public let prismStartingPage: String?

        /**
         End page
         */
        public let prismEndingPage: String?

        /**
         Page range
         */
        public let prismPageRange: String?

        /**
         Abstract

         - Remark:
         A displayed content is assumed to be that which is displayed when an user is not logged in.
         */
        public let description: String?

        /**
         Date of publication

         - Remark:
         The same as prism:publicationDate
         */
        public let dcDate: String?

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
    public struct ObjectiveID: Codable {
        /// @id
        public let id: String?

        /// CodingKeys
        private enum CodingKeys: String, CodingKey {
            case id = "@id"
        }
    }

    /// @value Object
    public struct ObjectiveValue: Codable {
        /// @value
        public let value: String?

        /// CodingKeys
        private enum CodingKeys: String, CodingKey {
            case value = "@value"
        }
    }
}
