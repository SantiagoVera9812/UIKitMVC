//
//  ImageCustom.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 24/10/24.
//

import UIKit
import SwiftUI

class ImageCustom: UIView {
    
    private func setStyle() {
        self.backgroundColor = .systemIndigo
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 200).isActive = true
        self.layer.cornerRadius = 20
        self.layer.shadowColor = UIColor.red.cgColor
        self.layer.shadowRadius = 6
        self.layer.shadowOpacity = 0.7
        self.layer.shadowOffset = .zero
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct ImageCustomSU: View {
    var backgroundColor: Color = .indigo
    var cornerRadius: CGFloat = 20
    var shadowColor: Color = .red
    var shadowOpacity: Double = 0.7
    var shadowRadius: CGFloat = 6
    var shadowOffset: CGSize = .zero
    
    var body: some View {
        Rectangle()
            .fill(Color.indigo)
            .cornerRadius(20)
            .shadow(color: Color.red.opacity(0.7), radius: 6, x: 0, y: 0)
            .frame(height: 200)
    }
}
