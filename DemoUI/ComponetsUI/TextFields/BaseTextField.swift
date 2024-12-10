//
//  BaseTextField.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 7/11/24.
//

import UIKit

class BaseTextField: UITextField {

    private var textChangedCallback: ((String?) -> Void)?
    private var returnKeyPressedCallback: (() -> Void)?
    private var padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

    init(textChangedCallback: @escaping (String?) -> Void,
         returnKeyPressedCallback: @escaping () -> Void) {
        
        self.textChangedCallback = textChangedCallback
        self.returnKeyPressedCallback = returnKeyPressedCallback
        super.init(frame: .zero)
        self.setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.delegate = self
        self.setupUI()
    }

    private func setupUI() {
        self.delegate = self
        self.backgroundColor = .white
        self.borderStyle = .none
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
        self.font = UIFont.systemFont(ofSize: 16)
        self.textColor = .black
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 54).isActive = true
        self.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }

    @objc private func textDidChange() {
        self.textChangedCallback?(self.text)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

//MARK: - Events
extension BaseTextField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.returnKeyPressedCallback?()
        return true
    }
}
