//
//  IconButton.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 12/11/24.
//

import UIKit

class IconButton: UIButton {

    private var actionHandler: (() -> Void)?

    init(icon: UIImage? = nil, title: String, actionHandler: @escaping () -> Void) {
        self.actionHandler = actionHandler
        super.init(frame: .zero)
        self.setupWith(title, andIcon: icon)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupWith(_ title: String, andIcon icon: UIImage?) {
        self.configuration = self.setupButtonConfiguration(title: title, andIcon: icon)
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    private func setupButtonConfiguration(title: String, andIcon icon: UIImage?) -> UIButton.Configuration {
        var config = UIButton.Configuration.plain()
        config.title = title
        config.background.backgroundColor = .clear
        config.titleAlignment = .center
        config.baseForegroundColor = .darkGray
        
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 14, weight: .light)
            return outgoing
        }
        
        if let icon = icon {
            config.image = icon
            config.imagePadding = 10
            config.imagePlacement = .leading
        }
        
        return config
    }

    @objc private func buttonTapped() {
        self.actionHandler?()
    }
}
