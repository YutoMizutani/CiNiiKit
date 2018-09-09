//
//  ScreenSize.swift
//  Demo
//
//  Created by Yuto Mizutani on 2018/08/28.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import UIKit

extension UIViewController {
    var bounds: CGRect {
        return UIScreen.main.bounds
    }
    var size: CGSize {
        return UIScreen.main.bounds.size
    }
    var height: CGFloat {
        return self.size.height
    }
    var width: CGFloat {
        return self.size.width
    }
}

extension UIView {
    var size: CGSize {
        return self.bounds.size
    }
    var height: CGFloat {
        return self.size.height
    }
    var width: CGFloat {
        return self.size.width
    }
    var safeArea: UIEdgeInsets {
        let safeAreaInsets: UIEdgeInsets
        if #available(iOS 11, *) {
            safeAreaInsets = self.safeAreaInsets
        } else {
            safeAreaInsets = .zero
        }
        return safeAreaInsets
    }
    var statusbarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }
}
