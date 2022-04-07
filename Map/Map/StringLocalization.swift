//
//  StringLocalization.swift
//  Map
//
//  Created by Nikita on 21.02.2022.
//

import Foundation

extension String {

    var localized: String {
        return NSLocalizedString(self, comment: "\(self)_comment")
    }
}

// How to use
// "hello".localized

