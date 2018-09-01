//
//  ViewController.swift
//  Demo
//
//  Created by Yuto Mizutani on 2018/08/27.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    var searchView: UIView!
    var copyrightView: UIView!
    var scrollView: UIScrollView!

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
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

    private func layoutView() {
        searchView: do {
            self.searchView.frame = self.view.bounds
        }
        copyrightView: do {
            self.copyrightView.frame = CGRect(x: 0, y: self.searchView.frame.maxY, width: self.width, height: 40 + self.view.safeArea.bottom)
        }
        scrollView: do {
            self.scrollView.frame = self.view.bounds
            self.scrollView.contentSize = CGSize(width: self.width, height: self.searchView.height + self.copyrightView.height)//self.scrollView.subviews.map { $0.height }.reduce(0) { $0 + $1 })
        }
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
