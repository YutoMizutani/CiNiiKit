//
//  CiNiiSortOrderType.swift
//  CiNiiKit
//
//  Created by Yuto Mizutani on 2018/08/29.
//

import Foundation

extension CiNiiKitArticles {
    /// Specifies the sorting condition. The default is 1. - https://support.nii.ac.jp/en/cia/api/a_opensearch
    public enum SearchSortOrderType: Int {

        /// Year of publication: descending order
        case yearOfPublicationDescending = 1

        /// Year of publication: ascending order
        case yearOfPublicationAscending = 2

        /// article name: descending order
        case articleNameDescending = 3

        /// article name: ascending order
        case articleNameAscending = 4

        /// journal name: descending order
        case journalNameDescending = 5

        /// journal name: ascending order
        case journalNameAscending = 6

        /// no. of cited by: descending order
        case numOfCitedDescending = 7
    }

    /// Specifies the sorting condition. The default is 1. - https://support.nii.ac.jp/en/cia/api/a_opensearch_auth
    public enum AuthorSortOrderType: Int {

        /// author name: descending order
        case authorNameDescending = 1

        /// author name: ascending order
        case authorNameAscending = 2

        /// no. of articles: descending
        case numOfArticlesDescending = 3
    }

    /// Specifies the sorting condition. The default is 1. - https://support.nii.ac.jp/en/cia/api/a_opensearch_full
    public enum FullTextSortOrderType: Int {

        /// Year of publication: descending order
        case yearOfPublicationDescending = 1

        /// Year of publication: ascending order
        case yearOfPublicationAscending = 2

        /// article name: descending order
        case articleNameDescending = 3

        /// article name: ascending order
        case articleNameAscending = 4

        /// journal name: descending order
        case journalNameDescending = 5

        /// journal name: ascending order
        case journalNameAscending = 6

        /// no. of cited by: descending order
        case numOfCitedDescending = 7

        /// Relevance: descending order
        case relevanceDescending = 8
    }
}