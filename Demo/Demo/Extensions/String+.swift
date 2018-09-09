//
//  String+.swift
//  Demo
//
//  Created by Yuto Mizutani on 2018/09/07.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import Foundation

extension String {
    /// Format date; e.g. "2018-09-07" -> "September 2018"
    var publicationDateString: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "en")
        guard let date = dateFormatter.date(from: self) else { return nil }
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: date)
    }
}
