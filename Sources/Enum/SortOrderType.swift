//
//  CiNiiSortOrderType.swift
//  CiNiiKit
//
//  Created by Yuto Mizutani on 2018/08/29.
//

import Foundation

public extension CiNiiKitArticles {
    struct SortOrderType {
        /**
         Specifies the sorting condition. The default is 1.

         - SeeAlso:
         https://support.nii.ac.jp/en/cia/api/a_opensearch
         */
        public enum Search: Int {

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

        /**
         Specifies the sorting condition. The default is 1.

         - SeeAlso:
         https://support.nii.ac.jp/en/cia/api/a_opensearch_auth
         */
        public enum Author: Int {

            /// author name: descending order
            case authorNameDescending = 1

            /// author name: ascending order
            case authorNameAscending = 2

            /// no. of articles: descending
            case numOfArticlesDescending = 3
        }

        /**
         Specifies the sorting condition. The default is 1.

         - SeeAlso:
         https://support.nii.ac.jp/en/cia/api/a_opensearch_full
         */
        public enum FullText: Int {

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
}

public extension CiNiiKitDissertations {
    /**
     Sort Order

     - SeeAlso:
     https://support.nii.ac.jp/en/cid/api/d_opensearch
     */
    enum SortOrderType: Int {

        /// Sorts results with the newest year at the top(default)
        case newestYearAtTheTop = 1

        /// Sorts results with the oldest year at the top
        case oldestYearAtTheTop = 2

        /// Sorts results with the title(A-Z)
        case titleAscending = 3

        /// Sorts results with the title(Z-A)
        case titleDescending = 4

        /// Sorts by relevance in descending order
        case relevanceDescending = 5
    }
}

public extension CiNiiKitBooks {
    struct SortOrderType {
        /**
         Sort Order

         - SeeAlso:
         https://support.nii.ac.jp/en/cib/api/b_opensearch
         */
        public enum Search: Int {

            /// Sorts by relevance in descending order(default)
            case relevanceDescending = 1

            /// Sorts results with the oldest year at the top
            case oldestYearAtTheTop = 2

            /// Sorts results with the newest year at the top
            case newestYearAtTheTop = 3

            /// Sorts by number of holding libraries with the lowest number at the top
            case lowestNumberAtTheTop = 4

            /// Sorts by number of holding libraries with the highest number at the top
            case highestNumberAtTheTop = 5
        }

        /**
         Specifies the sorting condition. The default is 1.

         - SeeAlso:
         https://support.nii.ac.jp/en/cib/api/b_opensearch_auth
         */
        public enum Author: Int {

            /// Sorts by relevance in descending order(default)
            case relevanceDescending = 1

            /// Sorts by name in ascending order of character code (A to Z)
            case authorNameAscending = 2

            /// Sorts by name in descending order of character code (Z to A)
            case authorNameDescending = 3

            /// Sorts by number of books with the lowest number at the top
            case lowestNumberAtTheTop = 4

            /// Sorts by number of books　with the highest number at the top
            case highestNumberAtTheTop = 5
        }

        /**
         Specifies the sorting condition. The default is 1.

         - SeeAlso:
         https://support.nii.ac.jp/en/cib/api/b_opensearch_lib
         */
        public enum Library: Int {

            /// Sorts by relevance in descending order(default)
            case relevanceDescending = 1

            /// Sorts by name in ascending order of character code (A to Z)
            case authorNameAscending = 2

            /// Sorts by name in descending order of character code (Z to A)
            case authorNameDescending = 3

            /// Sorts by number of books with the lowest number at the top
            case lowestNumberAtTheTop = 4

            /// Sorts by number of books　with the highest number at the top
            case highestNumberAtTheTop = 5
        }
    }
}
