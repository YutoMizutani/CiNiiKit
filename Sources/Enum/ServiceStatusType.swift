//
//  ServiceStatusType.swift
//  CiNiiKit
//
//  Created by Yuto Mizutani on 2018/09/01.
//

import Foundation

public extension CiNiiKitBooks {
    /**
     ServiceStatusType

     - SeeAlso:
     https://support.nii.ac.jp/en/cib/api/b_opensearch_hold
     */
    enum ServiceStatusType: String {

        /// Available
        case available = "A"

        /// Require at the other library
        case requireAtTheOtherLibrary = "C"

        /// Not available
        case notAvailable = "N"
    }
}
