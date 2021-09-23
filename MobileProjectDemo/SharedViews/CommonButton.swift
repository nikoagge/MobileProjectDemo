//
//  CommonButton.swift
//  MobileProjectDemo
//
//  Created by Nikos Aggelidis on 22/9/21.
//

import UIKit

@IBDesignable final class CommonButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        heightAnchor.constraint(equalToConstant: min(50, UIScreen.main.bounds.size.height * 0.075)).isActive = true
        titleLabel?.font = UIFont(name: "HelveticaNeue", size: 17)
        refresh()
    }
    
    func refresh() {
        setupBackgroundColor()
        setupBorder()
        layer.cornerRadius = cornerRadius
        setTitleColor(isWhite ? UIColor(red: 0.52, green: 0.76, blue: 0.44, alpha: 1) : .white, for: .normal)
        setTitleColor(isWhite ? UIColor(red: 0.52, green: 0.76, blue: 0.44, alpha: 1) : .white, for: .disabled)
    }
    
    private func setupBackgroundColor() {
        backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1)
    }
    
    private func setupBorder() {
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0.52, green: 0.76, blue: 0.44, alpha: 1).cgColor
    }
    
    override func prepareForInterfaceBuilder() {
        refresh()
    }
    
    override var isEnabled: Bool {
        didSet {
            refresh()
        }
    }

    
    // MARK: - Properties
    
    @IBInspectable
    var cornerRadius: CGFloat = 5 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    var isWhite: Bool = false {
        didSet {
            setup()
        }
    }
}
