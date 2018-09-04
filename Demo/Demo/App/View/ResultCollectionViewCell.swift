//
//  ResultCollectionViewCell.swift
//  Demo
//
//  Created by Yuto Mizutani on 2018/09/04.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var journalTextView: UITextView!
    @IBOutlet weak var authorTextView: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func prepareForReuse() {
        super.prepareForReuse()

        self.titleTextView?.text = ""
        self.journalTextView?.text = ""
        self.authorTextView?.text = ""
    }

    private func configureView() {
        titleTextView: do {
            self.titleTextView.textAlignment = .left
            self.titleTextView.isSelectable = true
            self.titleTextView.isEditable = false
        }
        journalTextView: do {
            self.journalTextView.textAlignment = .left
            self.journalTextView.isSelectable = true
            self.journalTextView.isEditable = false
        }
        authorTextView: do {
            self.authorTextView.textAlignment = .left
            self.authorTextView.isSelectable = true
            self.authorTextView.isEditable = false
        }
    }
}
