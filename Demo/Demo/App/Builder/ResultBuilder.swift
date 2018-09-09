//
//  ResultBuilder.swift
//  Demo
//
//  Created by Yuto Mizutani on 2018/09/04.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import CiNiiKit
import UIKit

/// ResultViewController builder
struct ResultBuilder {
    /// build UINavigationController with model
    func build(with model: ArticlesModel) -> UINavigationController {
        let nextViewController = ResultViewController(ResultModel(model: model))
        let navigationViewController = UINavigationController(rootViewController: nextViewController)
        navigationViewController.modalTransitionStyle = .coverVertical
        return navigationViewController
    }
}
