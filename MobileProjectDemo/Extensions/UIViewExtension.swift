//
//  UIViewExtension.swift
//  MobileProjectDemo
//
//  Created by Nikos Aggelidis on 21/9/21.
//

import UIKit

extension UIView {
    func addShadow(color: CGColor = UIColor.black.cgColor, offset: CGSize = CGSize(width: 0, height: 1), opacity: Float = 0.3) {
        layer.shadowColor = color
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
    }
    
    func fround(radius: CGFloat) {
        layer.cornerRadius = radius
    }
    
    static func newAutoLayoutView() -> Self {
        let view: UIView = Self()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view as! Self
    }
}
