//
//  ResultView.swift
//  Demo
//
//  Created by Yuto Mizutani on 2018/09/04.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import UIKit

class ResultView: UIView {
    /// Filtering bar from collections of search results
    private(set) var searchBar: UISearchBar = UISearchBar()
    /// View with contents of search results
    private(set) var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
        self.layoutView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutView()
        self.layoutIfNeeded()
    }
}

// MARK: - Private configure methods
private extension ResultView {
    /// Configure views
    private func configureView() {
        view: do {
            self.backgroundColor = .white
        }
        searchBar: do {
            self.searchBar.showsCancelButton = true
            self.collectionView.addSubview(self.searchBar)
        }
        collectionView: do {
            self.collectionView.backgroundColor = UIColor.white
            self.collectionView.register(UINib(nibName: "ResultCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ResultCollectionViewCell")
            let collectionViewLayout = UICollectionViewFlowLayout()
            self.collectionView.collectionViewLayout = collectionViewLayout
            self.addSubview(self.collectionView)
        }
    }

    /// Layout views
    private func layoutView() {
        let margin: CGFloat = 10
        let padding: CGFloat = 20 + self.safeArea.left + self.safeArea.right
        searchBar: do {
            let height: CGFloat = 44
            self.searchBar.frame = CGRect(x: 0, y: -margin / 2, width: self.width, height: height)
        }
        collectionView: do {
            let height: CGFloat = 97
            self.collectionView.frame = self.bounds
            self.collectionView.contentInset = UIEdgeInsets(top: margin / 2, left: 0, bottom: margin / 2, right: 0)
            if let collectionViewLayout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                collectionViewLayout.itemSize = CGSize(width: self.width - padding, height: height)
                collectionViewLayout.sectionInset = UIEdgeInsets.zero
                collectionViewLayout.minimumInteritemSpacing = padding
                collectionViewLayout.minimumLineSpacing = margin
                collectionViewLayout.headerReferenceSize = CGSize(width: self.width, height: self.searchBar.height)
            }
        }
    }
}
