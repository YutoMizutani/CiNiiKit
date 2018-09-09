//
//  SearchView.swift
//  Demo
//
//  Created by Yuto Mizutani on 2018/08/28.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import UIKit

class SearchView: UIView {
    private var titleView: UIView = UIView()
    var titleLabel: UILabel = UILabel()
    var apiKeyTextField: UITextField = UITextField()
    var searchWordTextField: UITextField = UITextField()
    var searchButton: UIButton = UIButton()
    /// Indicator when HTTP connection
    var indicatorView: UIActivityIndicatorView = UIActivityIndicatorView()

    private let gradientLayer: CAGradientLayer = CAGradientLayer()
    private var titleGradientLayer: CAGradientLayer = CAGradientLayer()

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
        self.configureAction()
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
    /// Configure views
    private func configureView() {
        backgroundColor: do {
            self.gradientLayer.colors = [
                UIColor(red: 66/255, green: 121/255, blue: 131/255, alpha: 1.0).cgColor,
                UIColor(red: 79/255, green: 144/255, blue: 156/255, alpha: 0.2).cgColor,
                UIColor(red: 79/255, green: 144/255, blue: 156/255, alpha: 0.1).cgColor,
                UIColor(red: 79/255, green: 144/255, blue: 156/255, alpha: 0.05).cgColor,
            ]
            self.layer.insertSublayer(self.gradientLayer, at: 0)
        }
        titleLabel: do {
            self.addSubview(self.titleView)
            self.titleLabel.text = "CiNiiKit Demo"
            self.titleLabel.textAlignment = .center
            self.titleLabel.font = UIFont(name: "ArialHebrew-Bold", size: 50)
            self.titleView.addSubview(self.titleLabel)
            self.titleGradientLayer.colors = [
                UIColor(red: 101/255, green: 107/255, blue: 113/255, alpha: 1.0).cgColor,
                UIColor(red: 79/255, green: 84/255, blue: 88/255, alpha: 1.0).cgColor,
            ]
            self.titleGradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
            self.titleGradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
            self.titleView.layer.addSublayer(self.titleGradientLayer)
            self.titleView.mask = self.titleLabel
        }
        apiKeyTextField: do {
            self.apiKeyTextField.borderStyle = .roundedRect
            self.apiKeyTextField.layer.borderColor = UIColor(red: 101/255, green: 107/255, blue: 113/255, alpha: 1.0).cgColor
            self.apiKeyTextField.placeholder = "API Key"
            self.apiKeyTextField.returnKeyType = .next
            self.apiKeyTextField.textAlignment = .left
            self.apiKeyTextField.font = UIFont.systemFont(ofSize: 12)
            self.addSubview(self.apiKeyTextField)
        }
        searchWordTextField: do {
            self.searchWordTextField.borderStyle = .roundedRect
            self.searchWordTextField.layer.borderColor = UIColor(red: 101/255, green: 107/255, blue: 113/255, alpha: 1.0).cgColor
            self.searchWordTextField.placeholder = "Freeword"
            self.searchWordTextField.returnKeyType = .search
            self.searchWordTextField.textAlignment = .left
            self.searchWordTextField.font = UIFont.systemFont(ofSize: 12)
            self.addSubview(self.searchWordTextField)
        }
        searchButton: do {
            self.searchButton.setBackgroundColor(UIColor.white, for: .normal)
            self.searchButton.setBackgroundColor(UIColor.gray, for: .highlighted)
            self.searchButton.layer.cornerRadius = 5
            self.searchButton.clipsToBounds = true
            self.searchButton.setTitleColor(UIColor(red: 66/255, green: 121/255, blue: 131/255, alpha: 1), for: .normal)
            self.searchButton.setTitle("Search", for: .normal)
            self.searchButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            self.addSubview(self.searchButton)
        }
        indicatorView: do {
            self.indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            self.addSubview(self.indicatorView)
        }
    }

    /// Configure actions
    private func configureAction() {
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tapAction)))
    }

    /// Layout views
    private func layoutView() {
        view: do {
            self.gradientLayer.frame = self.bounds
        }
        titleLabel: do {
            self.titleView.frame = CGRect(x: 0, y: 50, width: 350, height: 200)
            self.titleView.center.x = self.center.x
            self.titleLabel.frame = self.titleView.bounds
            self.titleGradientLayer.frame = self.titleView.bounds
        }

        let above: CGFloat = 250
        let margin: CGFloat = 40
        let height: CGFloat = 44
        apiKeyTextField: do {
            self.apiKeyTextField.frame = CGRect(x: margin, y: above, width: self.width - margin * 2, height: height)
        }
        searchButton: do {
            let width: CGFloat = 75
            self.searchButton.frame = CGRect(x: self.width - (width + margin), y: self.apiKeyTextField.frame.maxY + margin, width: width, height: height)
        }
        searchWordTextField: do {
            let leftMargin: CGFloat = 10
            self.searchWordTextField.frame = CGRect(x: margin, y: self.apiKeyTextField.frame.maxY + margin, width: self.width - (margin * 2) - leftMargin - self.searchButton.width, height: height)
        }
        indicatorView: do {
            self.indicatorView.center = self.center
        }
    }
}

// MARK: - Actions
private extension SearchView {
    /// Tap action
    @IBAction private func tapAction(sender: UITapGestureRecognizer) {
        self.endEditing(true)
    }
}
