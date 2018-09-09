//
//  ResultCollectionViewCell.swift
//  Demo
//
//  Created by Yuto Mizutani on 2018/09/04.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {
    /// Title
    @IBOutlet weak var titleTextView: UITextView!
    /// Journal, Volume, Year, Page
    @IBOutlet weak var journalTextView: UITextView!
    /// Author
    @IBOutlet weak var authorTextView: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.configureView()
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.configureView()
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        self.titleTextView?.text = ""
        self.journalTextView?.text = ""
        self.authorTextView?.text = ""
    }
}

// MARK: - Private configure methods
extension ResultCollectionViewCell {
    /// Configure views
    private func configureView() {
        cell: do {
            self.backgroundColor = UIColor.clear
            self.contentView.layer.cornerRadius = 10
            self.contentView.backgroundColor = UIColor.white
            self.contentView.clipsToBounds = true
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 2, height: 2.5)
            self.layer.shadowRadius = 3
            self.layer.shadowOpacity = 0.5
            self.clipsToBounds = false
        }
        titleTextView: do {
            self.titleTextView.textAlignment = .left
            self.titleTextView.isUserInteractionEnabled = false
            self.titleTextView.isSelectable = false
            self.titleTextView.isEditable = false
            self.titleTextView.textContainerInset = .zero
        }
        journalTextView: do {
            self.journalTextView.textAlignment = .left
            self.journalTextView.isUserInteractionEnabled = false
            self.journalTextView.isSelectable = false
            self.journalTextView.isEditable = false
            self.journalTextView.textContainerInset = .zero
        }
        authorTextView: do {
            self.authorTextView.textAlignment = .left
            self.authorTextView.isUserInteractionEnabled = false
            self.authorTextView.isSelectable = false
            self.authorTextView.isEditable = false
            self.authorTextView.textContainerInset = .zero
        }
    }
}
