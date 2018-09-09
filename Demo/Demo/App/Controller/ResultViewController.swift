//
//  ResultViewController.swift
//  Demo
//
//  Created by Yuto Mizutani on 2018/09/04.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import CiNiiKit
import SafariServices
import UIKit

class ResultViewController: UIViewController {
    /// View content
    private var resultView: ResultView = ResultView()
    /// Model content
    private var model: ResultModel

    init(_ model: ResultModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.layoutView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.layoutView()
        self.view.layoutIfNeeded()
    }
}

// MARK: - Private configure methods
extension ResultViewController {
    /// Configure views
    private func configureView() {
        view: do {
            self.view.backgroundColor = .white
        }
        navigationBar: do {
            self.title = self.model.searchWord
            let leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.leftBarButtonAction))
            self.navigationItem.leftBarButtonItem = leftBarButtonItem
            let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(self.rightBarButtonAction))
            self.navigationItem.rightBarButtonItem = rightBarButtonItem
        }
        resultView: do {
            self.resultView.searchBar.delegate = self
            self.resultView.collectionView.delegate = self
            self.resultView.collectionView.dataSource = self
            self.resultView.collectionView.register(UINib(nibName: "ResultCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
            self.view.addSubview(self.resultView)
        }
    }

    /// Layout views
    private func layoutView() {
        resultView: do {
            self.resultView.frame = self.view.bounds
        }
    }
}

// MARK: - Actions
extension ResultViewController {
    /// LeftBarButtonItem action
    @IBAction private func leftBarButtonAction(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    /// RightBarButtonItem action
    @IBAction private func rightBarButtonAction(sender: UIButton) {
        let navigationBarHeight: CGFloat = self.navigationController?.navigationBar.height ?? 0
        let searchBarHeight: CGFloat = self.resultView.searchBar.height
        let topInset: CGFloat = self.resultView.collectionView.contentInset.top
        self.resultView.collectionView.setContentOffset(CGPoint(x: 0, y: -(navigationBarHeight + searchBarHeight + topInset)), animated: true)
    }
}

// MARK: - Private methods
extension ResultViewController {
    /// Filter results with the keyword
    func filter(_ keyword: String?) {
        guard let keyword = keyword else { return }
        self.model.filter(with: keyword)
        self.resultView.collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate & UICollectionViewDataSource
extension ResultViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    /// Return number of cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.model.viewModels.count
    }

    // Return cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel = self.model.getViewModel(at: indexPath.row) else {
            return UICollectionViewCell()
        }
        let cell: ResultCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ResultCollectionViewCell
        cell.titleTextView?.text = viewModel.title
        cell.journalTextView?.text = viewModel.journal
        cell.authorTextView?.text = viewModel.author
        return cell
    }

    // Called when selected the cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let url = self.model.getViewModel(at: indexPath.row)?.link else { return }
        SFSafariViewController.present(self, url: url)
    }
}

// MARK: - UISearchBarDelegate
extension ResultViewController: UISearchBarDelegate {
    /// Called when text changes (including clear)
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.resultView.searchBar.returnKeyType = searchText == "" ? .done : .search
        self.filter(searchText)
    }

    /// Called when cancel button pressed
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        searchBar.text = ""
        self.filter(searchBar.text)
    }

    /// Called when keyboard search button pressed
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        self.filter(searchBar.text)
    }
}
