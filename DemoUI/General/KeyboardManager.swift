//
//  KeyboardManager.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 14/11/24.
//

import UIKit

class KeyboardManager {
    
    typealias InfoHandler = (_ info: Info) -> Void
    private var keyboardDidShowHandler: InfoHandler?
    private var keyboardWillHideHandler: InfoHandler?
    
    func registerKeyboardEvents(didShowHandler: @escaping InfoHandler, willHideHandler: @escaping InfoHandler) {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardDidShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
        self.keyboardDidShowHandler = didShowHandler
        self.keyboardWillHideHandler = willHideHandler
    }
    
    func unregisterKeyboardEvents() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func keyboardDidShow(_ notification: Notification) {
        let info = Info(userInfo: notification.userInfo)
        self.keyboardDidShowHandler?(info)
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        let info = Info(userInfo: notification.userInfo)
        self.keyboardWillHideHandler?(info)
    }
}

extension KeyboardManager {
    struct Info {
        let animationDuration: Double
        let originKeyboard: CGPoint
        
        init(userInfo: [AnyHashable: Any]?) {
            self.animationDuration = userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
            let frameKeyboard = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
            self.originKeyboard = frameKeyboard.origin
        }
    }
}
