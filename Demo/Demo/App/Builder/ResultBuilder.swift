//
//  ResultBuilder.swift
//  Demo
//
//  Created by Yuto Mizutani on 2018/09/04.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import CiNiiKit
import UIKit

struct ResultBuilder {
    func build(with model: ArticlesModel) -> ResultViewController {
        return ResultViewController(ResultModel(model: model))
    }
}
