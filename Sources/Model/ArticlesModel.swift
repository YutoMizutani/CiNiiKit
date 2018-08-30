//
//  ArticlesModel.swift
//  CiNiiKit
//
//  Created by Yuto Mizutani on 2018/08/30.
//

import Foundation

public struct ArticlesModel: Codable {
    let context: Context
    let id: String
    let graph: [Graph]

    private enum CodingKeys: String, CodingKey {
        case context = "@context"
        case id = "@id"
        case graph = "@graph"
    }

    struct Context: Codable {
        let vocab: String
        let dc: String
        let opensearch: String
        let prism: String
        let rdf: String
        let rdfs: String

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
        let id: String
        let type: String
        let dc_String: String
        let description: String
        let items: [Item]?
        let title: String
        let link: ObjectiveID
        let opensearch_itemsPerPage: String?
        let opensearch_startIndex: String?
        let opensearch_totalResults: String

        private enum CodingKeys: String, CodingKey {
            case id = "@id"
            case type = "@type"
            case dc_String = "dc:date"
            case description
            case items
            case title
            case link
            case opensearch_itemsPerPage = "opensearch:itemsPerPage"
            case opensearch_startIndex = "opensearch:startIndex"
            case opensearch_totalResults = "opensearch:totalResults"
        }
    }

    struct Item: Codable {
        let id: String?
        let type: String?
        let dc_creator: [ObjectiveValue]?
        let dc_String: String?
        let dc_publisher: String?
        let description: String?
        let link: ObjectiveID?
        let prism_endingPage: String?
        let prism_issn: String?
        let prism_number: String?
        let prism_pageRange: String?
        let prism_publicationString: String?
        let prism_publicationName: String?
        let prism_startingPage: String?
        let prism_volume: String?
        let rdfs_seeAlso: ObjectiveID?
        let title: String?

        private enum CodingKeys: String, CodingKey {
            case id = "@id"
            case type = "@type"
            case dc_creator = "dc:creator"
            case dc_String = "dc:date"
            case dc_publisher = "dc:publisher"
            case description
            case link
            case prism_endingPage = "prism:endingPage"
            case prism_issn = "prism:issn"
            case prism_number = "prism:number"
            case prism_pageRange = "prism:pageRange"
            case prism_publicationString = "prism:publicationString"
            case prism_publicationName = "prism:publicationName"
            case prism_startingPage = "prism:startingPage"
            case prism_volume = "prism:volume"
            case rdfs_seeAlso = "rdfs:seeAlso"
            case title
        }
    }

    struct ObjectiveID: Codable {
        let id: String?

        private enum CodingKeys: String, CodingKey {
            case id = "@id"
        }
    }

    struct ObjectiveValue: Codable {
        let value: String?

        private enum CodingKeys: String, CodingKey {
            case value = "@value"
        }
    }
}
