//
//  ViewController.swift
//  Demo
//
//  Created by Yuto Mizutani on 2018/08/27.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        layoutView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        layoutView()

        self.view.layoutIfNeeded()
    }

    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()

        layoutView()
    }
}

// MARK:- Private methods about settings
extension ViewController {
    /// Viewの構成を行う。
    private func configureView() {

    }

    /// Viewの更新を行う。
    private func layoutView() {

    }
}
