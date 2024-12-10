//
//  PrimaryActionButton.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 7/11/24.
//

import UIKit

class PrimaryActionButton: UIButton {

    private var actionHandler: (() -> Void)?

    init(title: String, actionHandler: @escaping () -> Void) {
        self.actionHandler = actionHandler
        super.init(frame: .zero)
        self.setupWith(title)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupWith(_ title: String) {
        self.configuration = setupButtonConfiguration(title: title)
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 48).isActive = true
        self.layer.cornerRadius = 24
        self.clipsToBounds = true
    }
    
    private func setupButtonConfiguration(title: String) -> UIButton.Configuration {
        var config = UIButton.Configuration.plain()
        config.title = title
        config.background.backgroundColor = .systemBlue
        config.baseForegroundColor = .white
        config.titleAlignment = .center
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.boldSystemFont(ofSize: 16)
            return outgoing
        }
        return config
    }

    @objc private func buttonTapped() {
        self.actionHandler?()
    }
}
