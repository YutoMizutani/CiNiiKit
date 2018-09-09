//
//  ViewController.swift
//  Demo
//
//  Created by Yuto Mizutani on 2018/08/27.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import CiNiiKit
import SafariServices
import UIKit

class SearchViewController: UIViewController {
    var searchView: SearchView!
    var copyrightView: CopyrightView!
    var scrollView: UIScrollView!

    var model: SearchModel!

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.configureModel()
        self.configureAction()
        self.layoutView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getKey()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.layoutView()
        self.view.layoutIfNeeded()
    }

    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        self.layoutView()
        self.view.layoutIfNeeded()
    }
}

// MARK: - Private configure methods
extension SearchViewController {
    /// Configure views
    private func configureView() {
        view: do {
            self.view.backgroundColor = .white
        }
        searchView: do {
            let searchView = SearchView()
            searchView.apiKeyTextField.delegate = self
            searchView.searchWordTextField.delegate = self
            self.searchView = searchView
        }
        copyrightView: do {
            let copyrightView = CopyrightView()
            copyrightView.textView.delegate = self
            self.copyrightView = copyrightView
        }
        scrollView: do {
            self.scrollView = ScrollView(contentViews: [self.searchView, self.copyrightView])
            self.scrollView.delegate = self
            self.view.addSubview(self.scrollView)
        }
    }

    /// Configure Model
    private func configureModel() {
        self.model = SearchModel()
    }

    /// Configure actions
    private func configureAction() {
        searchButton: do {
            self.searchView.searchButton.addTarget(self, action: #selector(self.searchAction), for: .touchUpInside)
        }
    }

    /// Layout views
    private func layoutView() {
        searchView: do {
            self.searchView.frame = self.view.bounds
        }
        copyrightView: do {
            self.copyrightView.frame = CGRect(x: 0, y: self.searchView.frame.maxY, width: self.width, height: 40 + self.view.safeArea.bottom)
        }
        scrollView: do {
            self.scrollView.frame = self.view.bounds
            self.scrollView.contentSize = CGSize(width: self.width, height: self.searchView.height + self.copyrightView.height)
        }
    }
}

// MARK: - Private methods
extension SearchViewController {
    /// Store API key
    private func storeKey() {
        guard let key = self.searchView.apiKeyTextField.text else { return }
        self.model.register(key)
    }

    /// Get API key
    private func getKey() {
        self.searchView.apiKeyTextField.text = self.model.getKey()
    }

    /// Search from CiNii
    private func search() {
        self.searchView.indicatorView.startAnimating()
        self.storeKey()

        guard let key = self.searchView.apiKeyTextField.text, let searchWord = self.searchView.searchWordTextField.text else { return }
        self.model.register(key)
        self.model.search(searchWord, success: { [weak self] model in
            guard let `self` = self else { return }
            self.searchView.indicatorView.stopAnimating()
            dump(model)
            let navigationViewController = ResultBuilder().build(with: model)
            self.present(navigationViewController, animated: true)
        }, failure: { [weak self] error in
            guard let `self` = self else { return }
            self.searchView.indicatorView.stopAnimating()
            dump(error)
        })
    }
}

// MARK: - Actions
extension SearchViewController {
    /// Search action
    @IBAction private func searchAction() {
        self.search()
    }
}

// MARK: - UITextFieldDelegate
extension SearchViewController: UITextFieldDelegate {
    /// Called when 'return' key pressed. return NO to ignore.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.searchView.apiKeyTextField:
            self.searchView.searchWordTextField.becomeFirstResponder()
        case self.searchView.searchWordTextField:
            self.search()
        default:
            textField.resignFirstResponder()
        }
        return true
    }

    /// Became first responder
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollView?.isScrollEnabled = false
    }

    /// May be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.scrollView?.isScrollEnabled = true
    }
}

// MARK: - UITextViewDelegate
extension SearchViewController: UITextViewDelegate {
    /// Called when press the link on the textView
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        SFSafariViewController.present(self, url: URL)
        return false
    }
}
