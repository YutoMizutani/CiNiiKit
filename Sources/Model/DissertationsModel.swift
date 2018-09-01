//
//  DissertationsModel.swift
//  CiNiiKit
//
//  Created by Yuto Mizutani on 2018/08/31.
//

import Foundation

public struct DissertationsModel: Codable {
    /**
     Document route element

     - Remark:
     "@context": {
     "@vocab": "http://purl.org/rss/1.0/"
     "rdf": "http://www.w3.org/1999/02/22-rdf-syntax-ns#",
     "rdfs": "http://www.w3.org/2000/01/rdf-schema#",
     "dc": "http://purl.org/dc/elements/1.1/",
     "prism": "http://prismstandard.org/namespaces/basic/2.0/",
     "opensearch": "http://a9.com/-/spec/opensearch/1.1/"
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
         http://www.w3.org/1999/02/22-rdf-syntax-ns#
         */
        let rdf: String

        /**
         - Remark:
         http://www.w3.org/2000/01/rdf-schema#
         */
        let rdfs: String

        /**
         - Remark:
         http://purl.org/dc/elements/1.1/
         */
        let dc: String

        /**
         - Remark:
         http://prismstandard.org/namespaces/basic/2.0/
         */
        let prism: String

        /**
         - Remark:
         http://a9.com/-/spec/opensearch/1.1/
         */
        let opensearch: String

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
         Concatenation with query to "CiNii Dissertations OpenSearch"
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
         "link": {@id:"http://ci.nii.ac.jp/d/500000000000"},
         */
        let link: ObjectiveID?

        /**
         URI of Bibliography JSON-LD

         - Remark:
         Indicates the URI of Bibliography JSON-LD (except parameter of appid)
         "rdfs:seeAlso":{@id:"http://ci.nii.ac.jp/d/500000000000.json"},
         */
        let rdfsSeeAlso: ObjectiveID?

        /**
         Author name
         */
        let dcCreator: [ObjectiveValue]?

        /**
         University
         */
        let dcPublisher: String?

        /**
         Types of degree
         */
        let ndlDegreeName: String?

        /**
         Grant ID
         */
        let ndlDissertationNumber: String?

        /**
         Degree year

         - Remark:
         W3CDTF format
         */
        let dcDate: String?

        let dcSource: [Source]?

        /**
         CodingKeys

         - Remark:
         It is described by the order of JSON.
         */
        private enum CodingKeys: String, CodingKey {
            case id = "@id"
            case type = "@type"
            case dcSource = "dc:source"
            case dcCreator = "dc:creator"
            case dcDate = "dc:date"
            case dcPublisher = "dc:publisher"
            case link
            case ndlDegreeName = "ndl:degreeName"
            case ndlDissertationNumber = "ndl:dissertationNumber"
            case rdfsSeeAlso = "rdfs:seeAlso"
            case title
        }
    }

    /// Source object
    struct Source: Codable {
        /**
         URL of full text
         */
        let id: String

        /**
         Data source name
         */
        let dcTitle: String

        /// CodingKeys
        private enum CodingKeys: String, CodingKey {
            case id = "@id"
            case dcTitle = "dc:title"
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
