//
//  HomeViewController.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 12/11/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeView: HomeView
    private let navigationStyle: NavigationBarStyle
    
    init(homeView: HomeView, navigationStyle: NavigationBarStyle) {
        self.homeView = homeView
        self.navigationStyle = navigationStyle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.homeView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationStyle.configure(self)
    }
}

extension HomeViewController {
    
    class func build() -> HomeViewController {
        let view = HomeView()
        let controller = HomeViewController(homeView: view,
                                            navigationStyle: NavigationBarSimpleShow())
        return controller
    }
    
    class func build2() -> HomeViewController {
        let view = HomeView()
        let controller = HomeViewController(homeView: view,
                                            navigationStyle: NavigationBarHide())
        return controller
    }
}

class HomeView: UIView {
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .systemIndigo
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
