//
//  NoBordersTextField.swift
//  MobileProjectDemo
//
//  Created by Nikos Aggelidis on 21/9/21.
//

import UIKit

class NoBordersTextField: UITextField {
    override open func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(copy(_:)) || action == #selector(cut(_:)){
            return false
        }
        
        return super.canPerformAction(action, withSender: sender)
    }
}
