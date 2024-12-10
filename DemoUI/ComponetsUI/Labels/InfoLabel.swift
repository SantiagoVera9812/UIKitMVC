//
//  InfoLabel.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 7/11/24.
//

import UIKit

class InfoLabel: UILabel {
    
    init(title: String) {
        super.init(frame: .zero)
        self.text = title
        self.font = .systemFont(ofSize: 16, weight: .light)
        self.numberOfLines = 0
        self.textAlignment = .left
        self.textColor = .darkGray
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
