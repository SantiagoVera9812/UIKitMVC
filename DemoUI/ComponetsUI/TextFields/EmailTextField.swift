//
//  EmailTextField.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 5/11/24.
//

import UIKit
import SwiftUI

class EmailTextField: BaseTextField {

    override init(textChangedCallback: @escaping (String?) -> Void, returnKeyPressedCallback: @escaping () -> Void) {
        super.init(
            textChangedCallback: textChangedCallback,
            returnKeyPressedCallback: returnKeyPressedCallback
        )
        self.setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    private func setup() {
        self.placeholder = "Ingresa un correo"
        self.keyboardType = .emailAddress
        self.autocapitalizationType = .none
        self.autocorrectionType = .no
    }
}

struct EmailTextFieldSU: View {
    
    @Binding var text: String
    
    var body: some View {
        TextField("Ingresa un correo", text: $text)
            .padding(.horizontal, 12)
            .padding(.vertical, 12)
            .background(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1))
            .font(.system(size: 16))
            .foregroundColor(.black)
            .frame(height: 48)
            .keyboardType(.emailAddress)
    }
}
