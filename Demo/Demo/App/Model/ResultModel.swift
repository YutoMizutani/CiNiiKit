//
//  ResultModel.swift
//  Demo
//
//  Created by Yuto Mizutani on 2018/09/04.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import CiNiiKit
import UIKit

struct ResultViewModel {
    let title: String
    let journal: String
    let author: String
    let link: URL?
}

struct ResultModel {
    private(set) var viewModels: [ResultViewModel]

    init(model: ArticlesModel) {
        self.viewModels = []
    }

    mutating func append(_ model: ArticlesModel) {
    }

    mutating func clear(_ model: ArticlesModel) {
        self.viewModels = []
    }
}
