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

class ViewController: UIViewController {
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.layoutView()
        self.view.layoutIfNeeded()
    }

    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        self.layoutView()
    }
}

// MARK: - Private configure methods
extension ViewController {
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

    private func configureModel() {
        self.model = SearchModel()
        self.searchView.apiKeyTextField.text = self.model.getAPIKey()
    }

    private func configureAction() {
        searchButton: do {
            self.searchView.searchButton.addTarget(self, action: #selector(self.searchAction), for: .touchUpInside)
        }
    }

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

// MARK: - Private configure methods
extension ViewController {
    private func search() {
        guard let key = self.searchView.apiKeyTextField.text, let searchWord = self.searchView.searchWordTextField.text else { return }
        self.model.register(key)
        self.model.search(searchWord, success: { model in
            dump(model)
        }, failure: { error in
            dump(error)
        })
    }
}

// MARK: - Actions
extension ViewController {
    @IBAction private func searchAction() {
        self.search()
    }
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == self.searchView.apiKeyTextField {
            self.searchView.searchWordTextField.becomeFirstResponder()
        }else if textField == self.searchView.searchWordTextField {

        }else{
            textField.resignFirstResponder()
        }

        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollView?.isScrollEnabled = false
    }

    func textFieldDidEndEditing(_ textField:UITextField) {
        self.scrollView?.isScrollEnabled = true
    }
}

// MARK: - UITextViewDelegate
extension ViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        let safariViewController = SFSafariViewController(url: URL)
        safariViewController.modalPresentationStyle = .overFullScreen
        self.present(safariViewController, animated: true, completion: nil)
        return false
    }
}
