//
//  StringExtension.swift
//  MobileProjectDemo
//
//  Created by Nikos Aggelidis on 16/10/21.
//

import Foundation

extension String {
    func isValid() -> Bool {
        let regex = "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$"
        
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
}
