//
//  String+.swift
//  CiNiiKit iOS
//
//  Created by Yuto Mizutani on 2018/09/13.
//

import Foundation

extension String {
    init?(_ source: Int?) {
        guard let source = source else {
            return nil
        }
        self = "\(source)"
    }
}
