//
//  PasswordTextField.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 7/11/24.
//

import UIKit

class PasswordTextField: BaseTextField {

    private lazy var toggleButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(systemName: "eye"), for: .normal)
        btn.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        btn.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = true
        btn.widthAnchor.constraint(equalToConstant: 44).isActive = true
        return btn
    }()

    override init(textChangedCallback: @escaping (String?) -> Void, returnKeyPressedCallback: @escaping () -> Void) {
        super.init(
            textChangedCallback: textChangedCallback,
            returnKeyPressedCallback: returnKeyPressedCallback
        )
        self.setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setup() {
        self.placeholder = "Ingresa tu contraseña"
        self.isSecureTextEntry = true
        self.autocorrectionType = .no
        self.setupToggleButton()
    }
    
    private func setupToggleButton() {
        let view = UIView()
        view.backgroundColor = .clear
        view.addSubview(self.toggleButton)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.toggleButton.topAnchor.constraint(equalTo: view.topAnchor),
            self.toggleButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.toggleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.toggleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        self.rightView = view
        self.rightViewMode = .always
    }

    @objc private func togglePasswordVisibility() {
        self.isSecureTextEntry.toggle()
        self.toggleButton.isSelected.toggle()
    }
}
