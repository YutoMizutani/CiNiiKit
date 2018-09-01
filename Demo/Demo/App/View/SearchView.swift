//
//  SearchView.swift
//  Demo
//
//  Created by Yuto Mizutani on 2018/08/28.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import UIKit

class SearchView: UIView {
    let gradientLayer: CAGradientLayer = CAGradientLayer()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
        self.layoutView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutView()
        self.layoutIfNeeded()
    }
}

// MARK: - Private configure methods
private extension SearchView {
    func configureView() {
        backgroundColor: do {
            self.gradientLayer.colors = [
                UIColor(red: 66/255, green: 121/255, blue: 131/255, alpha: 1.0).cgColor,
                UIColor(red: 79/255, green: 144/255, blue: 156/255, alpha: 0.2).cgColor,
                UIColor(red: 79/255, green: 144/255, blue: 156/255, alpha: 0.1).cgColor,
                UIColor(red: 79/255, green: 144/255, blue: 156/255, alpha: 0.05).cgColor,
            ]
            self.layer.insertSublayer(self.gradientLayer, at: 0)
        }
    }

    func layoutView() {
        backgroundColor: do {
            self.gradientLayer.frame = self.bounds
        }
    }
}
