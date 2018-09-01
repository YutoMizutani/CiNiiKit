//
//  ILLStatusType.swift
//  CiNiiKit
//
//  Created by Yuto Mizutani on 2018/09/02.
//

import Foundation

public extension CiNiiKitBooks {
    /**
     ILL Status

     - SeeAlso:
     https://support.nii.ac.jp/en/cib/api/b_opensearch_hold
     */
    enum ILLStatusType: String {

        /// Participant
        case Available = "A"

        /// Not Available
        case notAvailable = "N"
    }
}
