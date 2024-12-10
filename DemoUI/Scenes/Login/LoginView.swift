//
//  LoginView.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 7/11/24.
//

import UIKit
import SwiftUI

protocol LoginViewDelegate: AnyObject {
    func loginView(_ view: LoginView, didSignInWith user: String?, andPassword password: String?)
    func loginViewRecoverPassword(_ view: LoginView)
    func loginViewSignUp(_ view: LoginView)
}

class LoginView: UIView {
    
    weak var delegate: LoginViewDelegate?
    
    lazy var txtEmail = EmailTextField { newValue in
        
    } returnKeyPressedCallback: {
        self.txtPassword.becomeFirstResponder()
    }

    lazy var txtPassword = PasswordTextField { newValue in
        
    } returnKeyPressedCallback: {
        self.doSignIn()
    }
    
    lazy var lblEmailInfo = InfoLabel(title: "Correo:")
    lazy var lblPasswordInfo = InfoLabel(title: "Contraseña:")
    
    lazy var stkEmail = VerticalStack(subViews: [self.lblEmailInfo, self.txtEmail], spacing: 5)
    lazy var stkPassword = VerticalStack(subViews: [self.lblPasswordInfo, self.txtPassword], spacing: 5)
    
    lazy var btnSignIn = PrimaryActionButton(title: "INICIAR SESIÓN") {
        self.doSignIn()
    }
    
    lazy var stkContent = VerticalStack(subViews: [self.stkEmail, self.stkPassword, self.btnSignIn, self.btnSingUp],
                                        spacing: 20,
                                        margins: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
    
    lazy var btnSingUp = IconButton(title: "Regístrate aquí") {
        self.delegate?.loginViewSignUp(self)
    }
    
    lazy var btnRecoverPassword = IconButton(icon: UIImage(systemName: "square.and.arrow.up"),
                                             title: "¿Olvidaste tu contraseña?") {
        self.delegate?.loginViewRecoverPassword(self)
    }

    private lazy var viewImage: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 60).isActive = true
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var stkHeader: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self.viewImage)
        self.viewImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.viewImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        view.backgroundColor = .green
        return view
    }()
    
    lazy var anchorCenterYContent: NSLayoutConstraint = {
        NSLayoutConstraint(item: self.stkContent,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .centerY,
                           multiplier: 1.3,
                           constant: 0)
    }()
    
    init() {
        super.init(frame: .zero)
        self.addElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        self.addSubview(self.stkHeader)
        self.addSubview(self.stkContent)
        self.addSubview(self.btnRecoverPassword)
        self.backgroundColor = .white
        let tapCloseKeyboard = UITapGestureRecognizer(target: self,
                                                      action: #selector(self.tapToCloseKeyboard(_:)))
        self.addGestureRecognizer(tapCloseKeyboard)
        
        NSLayoutConstraint.activate([
            self.stkHeader.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.stkHeader.bottomAnchor.constraint(equalTo: self.stkContent.topAnchor),
            self.stkHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stkHeader.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.stkContent.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.stkContent.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.anchorCenterYContent,
            self.btnRecoverPassword.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            self.btnRecoverPassword.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func doSignIn() {
        self.delegate?.loginView(self,
                                 didSignInWith: self.txtEmail.text,
                                 andPassword: self.txtPassword.text)
    }
    
    func keyboardShowWith(_ origin: CGPoint, duration: Double) {
        if origin.y < self.stkContent.frame.maxY {
            let delta = origin.y - self.stkContent.frame.maxY
            UIView.animate(withDuration: duration) {
                self.anchorCenterYContent.constant = delta
                self.layoutIfNeeded()
            }
        }
    }
    
    func keyboardDisappearWith(_ duration: Double) { 
        UIView.animate(withDuration: duration) {
            self.anchorCenterYContent.constant = 0
            self.layoutIfNeeded()
        }
    }
    
    @objc func tapToCloseKeyboard(_ gesture: UITapGestureRecognizer) {
        self.endEditing(true)
    }
}

struct LoginViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> LoginView {
        let view = LoginView()
        return view
    }
    
    func updateUIView(_ uiView: LoginView, context: Context) { }
}

struct LoginViewPreview: PreviewProvider {
    static var previews: some View { LoginViewRepresentable() }
}
