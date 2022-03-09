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
/*
  func localized(_ args: [CVarArg]) -> String {
    return localized(args)
  }
*/
  func localized(_ args: CVarArg...) -> String {
    return String(format: localized, args)
  }
}

/// How to use
// "hello".localized
// "hello %@! you are %d years old".localized("Mike", 25)
// "hello %@! you are %d years old".localized(["Mike", 25])
