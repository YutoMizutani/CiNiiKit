//
//  Int+.swift
//  CiNiiKit iOS
//
//  Created by Yuto Mizutani on 2018/09/13.
//

import Foundation

extension Int {
    init?(_ source: String?) {
        guard let source = source,
            let impl = Int(source) else {
            return nil
        }
        self = impl
    }
}
