//
//  LoginViewController.swift
//  CookForMe
//
//  Created by Ahir on 04/04/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet weak var lblLoginToUrAccount: UILabel!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnForgetPassword: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lblDontHaveAccount: UILabel!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var lblLogoName: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    
    static let storyboardIdentifer = String(describing: LoginViewController.self)

    // MARK: Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        designCanvas()
    }
    
    // MARK: IBAction
    @IBAction func btnFogetPasswordClicked(_ sender: UIButton) {
    }
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        let homeStoryBoard = UIStoryboard(name: "Home", bundle: nil)
        if let ctrl = homeStoryBoard.instantiateViewController(
            withIdentifier: HomeViewController.storyboardIdentifer) as? HomeViewController {
            navigationController?.pushViewController(ctrl, animated: true)
        }
    }
    @IBAction func btnSignupClicked(_ sender: UIButton) {
    }
}

// MARK: Setup UIs
extension LoginViewController {
    
    private func designCanvas() {
        setupBackgroundView()
        setupLoginToUrAccountLabel()
        setupUserNameTextField()
        setupPasswordTextField()
        setupForgetPassewordButton()
        setupLoginButton()
        setupDontHaveAccountLabel()
        setupSignUpButton()
        hideNavigationBar()
        setupLogoNameLabel()
        setupLogoImg()
        setupLogoBgView()
    }
    
    private func setupBackgroundView() {
        backgroundView.setUpView(bgColor: CookMeColors.black,
                                 roundCorners: [.topLeft, .topRight],
                                 radius: 30)
    }
    
    private func setupLoginToUrAccountLabel() {
        lblLoginToUrAccount.setupLabel(CookMeColors.white,
                                       text: Texts.loginToYourAccount,
                                       font: Fonts.latoBold_18)
    }
    
    private func setupUserNameTextField() {
        txtUsername.setupTextField(with: 22.0, placeholder: Texts.userName)
    }
    
    private func setupPasswordTextField() {
        txtPassword.setupTextField(with: 22.0, placeholder: Texts.password)
    }
    
    private func setupDontHaveAccountLabel() {
        lblDontHaveAccount.setupLabel(CookMeColors.white,
                                      text: Texts.dontHaveAnAccount,
                                      font: Fonts.latoRegular_15)
    }
    
    private func setupLoginButton() {
        btnLogin.setupButton(with: Texts.login,
                             textColor: CookMeColors.white,
                             backgroundColor: CookMeColors.orangeThemeColor,
                             cornerRadius: 22.00)
    }
    
    private func setupSignUpButton() {
        btnSignUp.setupButton(with: Texts.signup,
                              textColor: CookMeColors.orangeThemeColor,
                              backgroundColor: nil,
                              cornerRadius: nil,
                              font: Fonts.latoRegular_15)
    }
    
    private func setupForgetPassewordButton() {
        btnForgetPassword.setupButton(with: Texts.forgetPasseword,
                                      textColor: CookMeColors.white,
                                      backgroundColor: nil,
                                      cornerRadius: nil,
                                      font: Fonts.latoRegular_15)
    }
    
    private func setupLogoNameLabel() {
        lblLogoName.setupLabel(CookMeColors.white,
                               text: Texts.cookIt.uppercased(),
                               font: Fonts.latoBold_35)
    }
    
    private func setupLogoImg() {
        imgLogo.setupImages(AppImages.logoImg.rawValue,
                            cornerRadius: imgLogo.bounds.height / 2,
                            backgroundColor: CookMeColors.white)
        
    }
    
    private func setupLogoBgView() {
        logoView.setUpView(bgColor: CookMeColors.black.withAlphaComponent(0.2))
    }
    
    private func hideNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
}
