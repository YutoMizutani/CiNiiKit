//
//  SFSafariViewController+.swift
//  Demo
//
//  Created by Yuto Mizutani on 2018/09/07.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import SafariServices

extension SFSafariViewController {
    /// Transition Safari view from URL
    static func present(_ base: UIViewController, url: URL,
                        presentationStyle style: UIModalPresentationStyle = .overFullScreen,
                        completion: (() -> Void)? = nil) {
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.modalPresentationStyle = style
        base.present(safariViewController, animated: true, completion: completion)
    }
}
