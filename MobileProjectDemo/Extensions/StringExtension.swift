//
//  StringExtension.swift
//  MobileProjectDemo
//
//  Created by Nikos Aggelidis on 16/10/21.
//

import Foundation

extension String {
    func isValid() -> Bool {
        let regex = "^(?=.*[A-Z]{2,})(?=.*[!@#$&*]{1,})(?=.*[0-9]{2,})(?=.*[a-z]{3,}).{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
}
