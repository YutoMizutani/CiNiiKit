//
//  ParticipantType.swift
//  CiNiiKit
//
//  Created by Yuto Mizutani on 2018/09/02.
//

import Foundation

public extension CiNiiKitBooks {
    /**
     ParticipantType

     - SeeAlso:
     https://support.nii.ac.jp/en/cib/api/b_opensearch_hold
     */
    enum ParticipantType: String {

        /// Participant
        case participant = "A"

        /// Not Participant
        case notParticipant = "N"
    }
}
