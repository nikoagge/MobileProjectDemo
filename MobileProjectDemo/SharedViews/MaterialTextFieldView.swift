//
//  MaterialTextFieldView.swift
//  MobileProjectDemo
//
//  Created by Nikos Aggelidis on 21/9/21.
//

import UIKit

@IBDesignable final class MaterialTextfieldView: UIView {
    var noBordersTextfield: NoBordersTextField = {
        let noBordersTextfield = NoBordersTextField.newAutoLayoutView()
        noBordersTextfield.borderStyle = .none
        noBordersTextfield.font = UIFont(name: "Helvetica", size: 16)
        noBordersTextfield.textColor = .white
        noBordersTextfield.autocapitalizationType = .none
        noBordersTextfield.autocorrectionType = UITextAutocorrectionType.no
        
        return noBordersTextfield
    }()
    
    private var lineView: UIView = {
        let lineView = UIView.newAutoLayoutView()
        lineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        lineView.backgroundColor = UIColor(red: 0.31, green: 0.64, blue: 0.21, alpha: 1)
        
        return lineView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        self.backgroundColor = .clear
        addTextField()
        addLineView()
    }
    
    private func addTextField() {
        addSubview(noBordersTextfield)
        noBordersTextfield.topAnchor.constraint(equalTo: topAnchor).isActive = true
        noBordersTextfield.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6).isActive = true
        noBordersTextfield.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6).isActive = true
    }
    
    private func addLineView() {
        addSubview(lineView)
        lineView.topAnchor.constraint(equalTo: noBordersTextfield.bottomAnchor, constant: 7).isActive = true
        lineView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lineView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    
    override func prepareForInterfaceBuilder() {
        setup()
    }
    
    //MARK: Properties
    
    @IBInspectable
    var text: String = "" {
        didSet {
            self.noBordersTextfield.text = text
        }
    }
    
    @IBInspectable
    var placeholder: String = "" {
        didSet {
            self.noBordersTextfield.placeholder = placeholder
        }
    }
    
    @IBInspectable
    var textContentType: String = "name" {
        didSet {
            self.noBordersTextfield.textContentType = UITextContentType(rawValue: textContentType)
        }
    }
    
    @IBInspectable
    var isSecureTextEntry: Bool = false {
        didSet {
            self.noBordersTextfield.isSecureTextEntry = isSecureTextEntry
        }
    }
}
