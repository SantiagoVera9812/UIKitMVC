//
//  NavigationBarStyle.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 20/11/24.
//

import UIKit

protocol NavigationBarStyle {
    func configure(_ viewController: UIViewController)
}

struct NavigationBarHide: NavigationBarStyle {
    func configure(_ viewController: UIViewController) {
        viewController.navigationController?.isNavigationBarHidden = true
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                                          style: .plain,
                                                                          target: nil,
                                                                          action: nil)
    }
}

struct NavigationBarSimpleShow: NavigationBarStyle {
    func configure(_ viewController: UIViewController) {
        viewController.navigationController?.isNavigationBarHidden = false
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                                          style: .plain,
                                                                          target: nil,
                                                                          action: nil)
        viewController.navigationController?.navigationBar.tintColor = .black
    }
}

struct NavigationBarTitle: NavigationBarStyle {
    
    private let title: String
    
    init(title: String) {
        self.title = title
    }
    
    func configure(_ viewController: UIViewController) {
        viewController.title = self.title
        viewController.navigationController?.isNavigationBarHidden = false
        viewController.navigationItem.hidesBackButton = true
        viewController.navigationController?.navigationBar.tintColor = .black
    }
}
