//
//  ScrollView.swift
//  Demo
//
//  Created by Yuto Mizutani on 2018/08/28.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import UIKit

class ScrollView: UIScrollView {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
        self.layoutView()
    }

    convenience init(contentViews: [UIView]) {
        self.init(frame: .zero)
        contentViews.forEach { self.addSubview($0) }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutView()
        self.layoutIfNeeded()
    }
}

// MARK: - Private configure methods
private extension ScrollView {
    func configureView() {
        self.contentInsetAdjustmentBehavior = .never
        self.showsVerticalScrollIndicator = false
        self.bounces = false
        self.isPagingEnabled = true
    }

    func layoutView() {
    }
}
