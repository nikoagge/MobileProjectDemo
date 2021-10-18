//
//  LoginViewController.swift
//  MobileProjectDemo
//
//  Created by Nikos Aggelidis on 23/9/21.
//

import UIKit

class LoginViewController: UIViewController, Coordinator {
    @IBOutlet weak var userIDDescriptionLabel: UILabel!
    @IBOutlet weak var userIDInfoButton: UIButton!
    @IBOutlet weak var userIDMaterialTextfieldView: MaterialTextfieldView!
    @IBOutlet weak var passwordDescriptionLabel: UILabel!
    @IBOutlet weak var passwordInfoButton: UIButton!
    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var passwordMaterialTextfieldView: MaterialTextfieldView!
    @IBOutlet weak var infoDescriptionLabelContentView: UIView!
    @IBOutlet weak var infoDescriptionLabel: UILabel!
    @IBOutlet weak var currentLanguageContentView: UIView!
    @IBOutlet weak var currentLanguageImageView: UIImageView!
    @IBOutlet weak var currentLanguageDescriptionLabel: UILabel!
    @IBOutlet weak var showMoreLanguagesButton: UIButton!
    @IBOutlet weak var languagesStackView: UIStackView!
    @IBOutlet weak var englishLanguageContentView: UIView!
    @IBOutlet weak var englishLanguageImageButton: UIButton!
    @IBOutlet weak var englishLanguageDescriptionButton: UIButton!
    @IBOutlet weak var greekLanguageContentView: UIView!
    @IBOutlet weak var greekLanguageImageButton: UIButton!
    @IBOutlet weak var greekLanguageDescriptionButton: UIButton!
    @IBOutlet weak var loginCommonButton: CommonButton!
    
    private var infoDescriptionLabelContentViewIsHidden = true
    private var languagesStackViewIsHidden = true
    private var greekLanguageIsSelected = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userIDMaterialTextfieldView.noBordersTextfield.text = "TH1234"
        passwordMaterialTextfieldView.noBordersTextfield.text = "3NItas1!"
        setupUI()
    }
    
    @IBAction func userIDInfoButtonTouchUpInside(_ sender: UIButton) {
        infoDescriptionLabelContentViewConfiguration()
    }
    
    @IBAction func passwordInfoButtonTouchUpInside(_ sender: UIButton) {
        infoDescriptionLabelContentViewConfiguration()
    }
    
    @IBAction func showPasswordButtonTouchUpInside(_ sender: UIButton) {
        passwordMaterialTextfieldView.isSecureTextEntry = !passwordMaterialTextfieldView.isSecureTextEntry
    }
    
    
    @IBAction func showMoreLanguagesButtonTouchUpInside(_ sender: UIButton) {
        languagesStackViewIsHidden = !languagesStackViewIsHidden
        UIView.animate(withDuration: 0.4) {
            DispatchQueue.main.async {
                self.toggleAppearance(isHidden: self.languagesStackViewIsHidden, view: self.languagesStackView)
            }
        }
    }
    
    @IBAction func englishLanguageTouchUpInside(_ sender: UIButton) {
        greekLanguageIsSelected = false
        languagesStackViewIsHidden = true
        UIView.animate(withDuration: 0.2) {
            DispatchQueue.main.async {
                self.toggleAppearance(isHidden: self.languagesStackViewIsHidden, view: self.languagesStackView)
                self.toggleLanguageAppearance(greekLanguageIsSelected: self.greekLanguageIsSelected)
            }
        }
    }
    
    @IBAction func greekLanguageTouchUpInside(_ sender: UIButton) {
        greekLanguageIsSelected = true
        languagesStackViewIsHidden = true
        UIView.animate(withDuration: 0.2) {
            DispatchQueue.main.async {
                self.toggleAppearance(isHidden: self.languagesStackViewIsHidden, view: self.languagesStackView)
                self.toggleLanguageAppearance(greekLanguageIsSelected: self.greekLanguageIsSelected)
            }
        }
    }
    
    @IBAction func loginCommonButtonTouchUpInside(_ sender: CommonButton) {
        if let username = userIDMaterialTextfieldView.noBordersTextfield.text, let password = passwordMaterialTextfieldView.noBordersTextfield.text {
            guard !username.isEmpty, !password.isEmpty, password.isValid() else {
                presentAlertController(title: "Wrong Credentials", message: "Check again your credentials")
                return
            }
            let loginResponse = NetworkClient.shared.login(username: userIDMaterialTextfieldView.noBordersTextfield.text!, password: passwordMaterialTextfieldView.noBordersTextfield.text!)
            
            if loginResponse != nil {
                UserDefaults.standard.setValue(loginResponse?.accessToken, forKey: "accessToken")
//                let accessTokenDictionary: [String: String?] = ["accessToken": loginResponse?.accessToken]
//
//                NotificationCenter.default.post(name: .sendAccessToken, object: nil, userInfo: accessTokenDictionary)
                navigate(.init(page: .customTabBarController, navigationStyle: .push(animated: true)))
                userIDMaterialTextfieldView.noBordersTextfield.text = ""
                passwordMaterialTextfieldView.noBordersTextfield.text = ""
            } else {
                presentAlertController(title: "Error", message: "Something wrong happened with the network request.")
            }
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userIDMaterialTextfieldView.noBordersTextfield:
            passwordMaterialTextfieldView.noBordersTextfield.becomeFirstResponder()
                        
        case passwordMaterialTextfieldView.noBordersTextfield:
            passwordMaterialTextfieldView.noBordersTextfield.resignFirstResponder()
            
        default:
            textField.resignFirstResponder()
        }
        
        return true
    }
}

private extension LoginViewController {
    func setupUI() {
        infoDescriptionLabelContentView.fround(radius: 12)
        currentLanguageContentView.fround(radius: 12)
        languagesStackView.fround(radius: 12)
        englishLanguageContentView.fround(radius: 12)
        greekLanguageContentView.fround(radius: 12)
        toggleAppearance(isHidden: languagesStackViewIsHidden, view: languagesStackView)
        toggleAppearance(isHidden: infoDescriptionLabelContentViewIsHidden, view: infoDescriptionLabelContentView)
        textFieldsConfiguration()
        
        navigationController?.navigationBar.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1)
    }
    
    func toggleAppearance(isHidden: Bool, view: UIView) {
        if view == infoDescriptionLabelContentView {
            infoDescriptionLabelContentView.isHidden = isHidden ? true : false
        } else if view == languagesStackView {
            languagesStackView.isHidden = isHidden ? true : false
        }
    }
    
    func infoDescriptionLabelContentViewConfiguration() {
        infoDescriptionLabelContentViewIsHidden = !infoDescriptionLabelContentViewIsHidden
        UIView.animate(withDuration: 0.2) {
            self.toggleAppearance(isHidden: self.infoDescriptionLabelContentViewIsHidden, view: self.infoDescriptionLabelContentView)
        }
    }
    
    func toggleLanguageAppearance(greekLanguageIsSelected: Bool) {
        passwordDescriptionLabel.text = greekLanguageIsSelected ? "Κωδικός" : "Password"
        currentLanguageDescriptionLabel.text = greekLanguageIsSelected ? "Greek" : "English"
        infoDescriptionLabel.text = greekLanguageIsSelected ? "τουλάχιστον 8 χαρακτήρες (2 κεφαλαία, 3 πεζά, 1 ειδικός χαρακτήρας, 2 νούμερα)" : "at least 8 characters(2 capital letters, 3 lowercase, 1 special character, 2 numbers)"
        if greekLanguageIsSelected {
            showPasswordButton.setTitle("Προβολή", for: .normal)
            greekLanguageDescriptionButton.setTitleColor(.systemBlue, for: .normal)
            englishLanguageDescriptionButton.setTitleColor(.white, for: .normal)
            loginCommonButton.setTitle("Σύνδεση", for: .normal)
            currentLanguageImageView.image = #imageLiteral(resourceName: "greece-flag-round-icon")
        } else {
            showPasswordButton.setTitle("Show More", for: .normal)
            greekLanguageDescriptionButton.setTitleColor(.white, for: .normal)
            englishLanguageDescriptionButton.setTitleColor(.systemBlue, for: .normal)
            loginCommonButton.setTitle("Login", for: .normal)
            currentLanguageImageView.image = #imageLiteral(resourceName: "united-states-of-america-flag-round")
        }
    }
    
    func textFieldsConfiguration() {
        userIDMaterialTextfieldView.noBordersTextfield.becomeFirstResponder()
        userIDMaterialTextfieldView.noBordersTextfield.delegate = self
        passwordMaterialTextfieldView.noBordersTextfield.delegate = self
    }
}
