//
//  ResultView.swift
//  Demo
//
//  Created by Yuto Mizutani on 2018/09/04.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import UIKit

class ResultView: UIView {
    var searchBar: UISearchBar!

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
private extension ResultView {
    func configureView() {
        searchBar: do {
            self.searchBar = UISearchBar()
        }
    }

    func layoutView() {
    }
}
