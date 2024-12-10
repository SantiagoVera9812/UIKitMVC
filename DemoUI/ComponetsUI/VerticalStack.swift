//
//  HorizontalStack.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 24/10/24.
//

import UIKit

class VerticalStack: UIStackView {
    
    init(subViews: [UIView],
         spacing: CGFloat = 20,
         alignment: UIStackView.Alignment = .fill,
         margins: UIEdgeInsets = .zero) {
        
        super.init(frame: .zero)
        subViews.forEach({ self.addArrangedSubview($0) })
        self.axis = .vertical
        self.spacing = spacing
        self.isLayoutMarginsRelativeArrangement = true
        self.layoutMargins = margins
        self.backgroundColor = .clear
        self.alignment = alignment
        self.distribution = .fill
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class HorizontalStack: UIStackView {
    
    init(subViews: [UIView],
         distribution: UIStackView.Distribution = .fillEqually,
         spacing: CGFloat = 20,
         margins: UIEdgeInsets = .zero) {
        
        super.init(frame: .zero)
        subViews.forEach({ self.addArrangedSubview($0) })
        self.axis = .horizontal
        self.spacing = spacing
        self.alignment = .top
        self.distribution = distribution
        self.isLayoutMarginsRelativeArrangement = true
        self.layoutMargins = margins
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
