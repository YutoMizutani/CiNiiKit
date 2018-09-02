//
//  UIButton+.swift
//  Demo
//
//  Created by Yuto Mizutani on 2018/09/02.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import UIKit

fileprivate extension UIColor {
    var image: UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        context.setFillColor(self.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControlState) {
        let image = color.image
        self.setBackgroundImage(image, for: state)
    }
}
