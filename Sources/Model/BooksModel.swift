//
//  BooksModel.swift
//  CiNiiKit
//
//  Created by Yuto Mizutani on 2018/09/01.
//

import Foundation

/// Response Model for CiNii Books
public struct BooksModel: Codable {
    /**
     Document route element

     - Remark:
     "@context": {
     "dc": "http://purl.org/dc/elements/1.1/",
     "rdf": "http://www.w3.org/1999/02/22-rdf-syntax-ns#",
     "opensearch": "http://a9.com/-/spec/opensearch/1.1/",
     "rdfs": "http://www.w3.org/2000/01/rdf-schema#",
     "dcterms": "http://purl.org/dc/terms/",
     "prism": "http://prismstandard.org/namespaces/basic/2.0/",
     "cinii": "http://ci.nii.ac.jp/ns/1.0/",
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
         http://purl.org/dc/terms/
         */
        public let dcTerms: String

        /**
         - Remark:
         http://www.w3.org/1999/02/22-rdf-syntax-ns#
         */
        public let rdf: String

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
         - Remark:
         http://ci.nii.ac.jp/ns/1.0/
         */
        public let cinii: String

        /**
         - Remark:
         http://a9.com/-/spec/opensearch/1.1/
         */
        public let opensearch: String

        /**
         CodingKeys

         - Remark:
         It is described by the order of JSON.
         */
        private enum CodingKeys: String, CodingKey {
            case vocab = "@vocab"
            case cinii
            case dc
            case dcTerms = "dcterms"
            case opensearch
            case prism
            case rdf
            case rdfs
        }
    }

    /// @graph Object
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
         Concatenation with query to "CiNii Books OpenSearch"
         Example: 
         "title":"CiNii Books OpenSearch - 検索エンジン 順位",<
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
         "link": {@id:"http://ci.nii.ac.jp/ncid/XX12345678"},
         */
        public let link: ObjectiveID?

        /**
         URI of Bibliography JSON-LD

         - Remark:
         Indicates the URI of Bibliography JSON-LD (except parameter of appid)
         "rdfs:seeAlso":{@id:"http://ci.nii.ac.jp/ncid/XX12345678.json"},
         */
        public let rdfsSeeAlso: ObjectiveID?

        /**
         Author name
         */
        public let dcCreator: String?

        /**
         University
         */
        public let dcPublisher: [String]?

        /**
         Date of publication

         - Remark:
         W3CDTF format
         */
        public let prismPublicationDate: String?

        /**
         Date of publication

         - Remark:
         The same as prism:publicationDate
         */
        public let dcDate: String?

        /**
         Description of Parent bibliography

         - Remark:
         Repeated if there are multiple Parent bibliographies(series name).
         Example:
         "dcterms:isPartOf":[{"@id":"http://ci.nii.ac.jp/ncid/BN06190301","dc:title":"丸善ライブラリー"}],
         */
        public let dcTermsIsPartOf: [Bibliography]?

        /**
         Description of ISBN and ISSN

         - Remark:
         Repeated by the number of ISBN and ISSN.
         Example:
         "dcterms:hasPart":[{"@id":"urn:isbn:4591095142"},{"@id":"urn:isbn:9784591095607"},{"@id":"urn:isbn:9784591097526"}],
         */
        public let dcTermsHasPart: [ObjectiveID]?

        /**
         Number of Holding libraries

         - Remark:
         Number of Holding libraries of the book and the journal
         Example:
         "cinii:ownerCount":"179"
         */
        public let ciniiOwnerCount: String

        /**
         CodingKeys

         - Remark:
         It is described by the order of JSON.
         */
        private enum CodingKeys: String, CodingKey {
            case id = "@id"
            case type = "@type"
            case ciniiOwnerCount = "cinii:ownerCount"
            case dcCreator = "dc:creator"
            case dcDate = "dc:date"
            case dcPublisher = "dc:publisher"
            case dcTermsHasPart = "dcterms:hasPart"
            case dcTermsIsPartOf = "dcterms:isPartOf"
            case link
            case prismPublicationDate = "prism:publicationDate"
            case rdfsSeeAlso = "rdfs:seeAlso"
            case title
        }
    }

    /// Source object
    public struct Source: Codable {
        /**
         URL of full text
         */
        public let id: String

        /**
         Data source name
         */
        public let dcTitle: String

        /// CodingKeys
        private enum CodingKeys: String, CodingKey {
            case id = "@id"
            case dcTitle = "dc:title"
        }
    }

    /// Bibliography object
    public struct Bibliography: Codable {
        /**
         URI of Parent bibliography

         - Remark:
         URI of Parent bibliography (series name) at bibliography details page
         */
        public let id: String

        /**
         Title of Parent bibliography

         - Remark:
         Including the number of series
         */
        public let dcTitle: String

        /// CodingKeys
        private enum CodingKeys: String, CodingKey {
            case id = "@id"
            case dcTitle = "dc:title"
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
