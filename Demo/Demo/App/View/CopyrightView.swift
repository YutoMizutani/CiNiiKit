//
//  CopyrightView.swift
//  Demo
//
//  Created by Yuto Mizutani on 2018/08/28.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import UIKit

fileprivate struct Copyright {
    let text: String = "Copyright © 2018 Yuto Mizutani. \nReleased under the MIT license. See more on GitHub."
    var attributedString: NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self.text)
        attributedString.addAttribute(.link,
                                      value: "https://github.com/YutoMizutani/CiNiiKit",
                                      range: NSString(string: self.text).range(of: "GitHub"))
        return attributedString
    }
}

class CopyrightView: UIView {
    var textView: UITextView!

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
extension CopyrightView {
    private func configureView() {
        `self`: do {
            self.backgroundColor = UIColor.black
        }
        textView: do {
            self.textView = UITextView()
            self.textView.attributedText = Copyright().attributedString
            self.textView.backgroundColor = .black
            self.textView.textColor = UIColor.white
            self.textView.textAlignment = .center
            self.textView.isSelectable = true
            self.textView.isEditable = false
            self.addSubview(self.textView)
        }
    }

    func layoutView() {
        self.textView.frame = self.bounds
    }
}
