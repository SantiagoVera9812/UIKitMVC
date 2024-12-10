//
//  LoginViewController.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 7/11/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let loginView: LoginView
    private let navigationStyle: NavigationBarStyle
    private let keyboardManager = KeyboardManager()
    
    init(loginView: LoginView, navigationStyle: NavigationBarStyle) {
        self.loginView = loginView
        self.navigationStyle = navigationStyle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cofigureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationStyle.configure(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.keyboardManager.registerKeyboardEvents { info in
            self.loginView.keyboardShowWith(info.originKeyboard, duration: info.animationDuration)
        } willHideHandler: { info in
            self.loginView.keyboardDisappearWith(info.animationDuration)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.keyboardManager.unregisterKeyboardEvents()
    }
    
    private func cofigureView() {
        self.view = self.loginView
        self.loginView.delegate = self
    }
    
    private func goToHome() {
        let controller = TabBarController.buildCars()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension LoginViewController: LoginViewDelegate {
    
    func loginViewRecoverPassword(_ view: LoginView) {
        
    }
    
    func loginViewSignUp(_ view: LoginView) {
        
    }
    
    func loginView(_ view: LoginView, didSignInWith user: String?, andPassword password: String?) {
        
        guard let user = user, !user.isEmpty else {
            self.showErrorAlertWithMessage("Ingresa un usuario")
            return
        }
        
        guard let password = password, !password.isEmpty else {
            self.showErrorAlertWithMessage("Ingresa una constraseña")
            return
        }
        
        self.goToHome()
    }
}

extension LoginViewController {
    class func build() -> LoginViewController {
        let view = LoginView()
        let controller = LoginViewController(loginView: view,
                                             navigationStyle: NavigationBarHide())
        controller.title = "Kenyi"
        return controller
    }
}
