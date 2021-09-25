//
//  LoginViewController.swift
//  MobileProjectDemo
//
//  Created by Nikos Aggelidis on 23/9/21.
//

import UIKit

class LoginViewController: UIViewController {
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
    @IBOutlet weak var currentLanguageDescriptionButton: UILabel!
    @IBOutlet weak var showMoreLanguagesButton: UIButton!
    @IBOutlet weak var languagesStackView: UIStackView!
    @IBOutlet weak var englishLanguageContentView: UIView!
    @IBOutlet weak var englishLanguageImageButton: UIButton!
    @IBOutlet weak var englishLanguageDescriptionButton: UIButton!
    @IBOutlet weak var greekLanguageContentView: UIView!
    @IBOutlet weak var greekLanguageImageButton: UIButton!
    @IBOutlet weak var greekLanguageDescriptionButton: UIButton!
    @IBOutlet weak var loginCommonButton: CommonButton!
    
    var infoDescriptionLabelContentViewIsHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pr = NetworkClient.shared.login(userName: "TH1234", password: "3NItas1!")
        debugPrint(pr)
        
        setupUI()
    }
    
    @IBAction func userIDInfoButtonTouchUpInside(_ sender: UIButton) {
        infoDescriptionLabelContentViewConfiguration()
    }
    
    @IBAction func passwordInfoButtonTouchUpInside(_ sender: UIButton) {
        infoDescriptionLabelContentViewConfiguration()
    }
    
    @IBAction func showPasswordButtonTouchUpInside(_ sender: UIButton) {
    }
    
    
    @IBAction func showMoreLanguagesButtonTouchUpInside(_ sender: UIButton) {
    }
    
    @IBAction func englishLanguageTouchUpInside(_ sender: UIButton) {
    }
    
    @IBAction func greekLanguageTouchUpInside(_ sender: UIButton) {
    }
    
    @IBAction func loginCommonButtonTouchUpInside(_ sender: CommonButton) {
        
    }
}

private extension LoginViewController {
    func setupUI() {
        infoDescriptionLabelContentView.fround(radius: 12)
        currentLanguageContentView.fround(radius: 12)
        languagesStackView.fround(radius: 12)
        englishLanguageContentView.fround(radius: 12)
        greekLanguageContentView.fround(radius: 12)
        toggleAppearance(isHidden: true, view: languagesStackView)
        toggleAppearance(isHidden: infoDescriptionLabelContentViewIsHidden, view: infoDescriptionLabelContentView)
        
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
}
