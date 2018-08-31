//
//  RangeType.swift
//  CiNiiKit
//
//  Created by Yuto Mizutani on 2018/08/31.
//

import Foundation

public extension CiNiiKitDissertations {
    /**
     Range

     - SeeAlso:
     https://support.nii.ac.jp/en/cid/api/d_opensearch
     */
    enum RangeType: Int {

        /// all
        case all

        /// full text document on link to partner service
        case fullText
    }
}
