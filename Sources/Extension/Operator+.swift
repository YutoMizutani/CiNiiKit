//
//  Operator+.swift
//  CiNiiKit iOS
//
//  Created by Yuto Mizutani on 2018/08/29.
//

import Foundation

infix operator ?=

func ?=<T> (lhs: inout T, rhs: T?) {
    if let rhs = rhs {
        lhs = rhs
    }
}
