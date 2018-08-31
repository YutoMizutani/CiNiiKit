//
//  MaterialType.swift
//  CiNiiKit iOS
//
//  Created by Yuto Mizutani on 2018/09/01.
//

import Foundation

public extension CiNiiKitBooks {
    /**
     MaterialType

     - SeeAlso:
     https://support.nii.ac.jp/en/cib/api/b_opensearch
     */
    enum MaterialType: Int {

        /// unspecified (default)
        case unspecified

        /// books
        case books

        /// journals
        case journals
    }
}
