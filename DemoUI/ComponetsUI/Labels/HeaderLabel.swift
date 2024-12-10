//
//  HeaderLabel.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 24/10/24.
//

import UIKit
import SwiftUI

class HeaderLabel: UILabel {
    
    init(title: String) {
        super.init(frame: .zero)
        self.text = title
        self.font = .systemFont(ofSize: 25, weight: .bold)
        self.numberOfLines = 0
        self.textAlignment = .left
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct HeaderLabelSU: View {
    var text: String
    
    @State var emailText: String = "Hola mensaje de"
    
    var body: some View {
        Text(text)
            .font(.system(size: 25, weight: .bold))
            .foregroundColor(.black)
            .lineLimit(0)
            .multilineTextAlignment(.leading)
            .padding(.bottom, 5)
    }
}
