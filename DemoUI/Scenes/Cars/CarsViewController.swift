//
//  CarsViewController.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 26/11/24.
//

import UIKit

class CarsViewController: UIViewController {
    
    private let carsView: CarsView
    private let service: CarsWebServiceProtocol
    private let navigationStyle: NavigationBarStyle
    
    init(carsView: CarsView,
         service: CarsWebServiceProtocol,
         navigationStyle: NavigationBarStyle) {
        
        self.carsView = carsView
        self.service = service
        self.navigationStyle = navigationStyle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchCars()
        self.navigationStyle.configure(self)
    }
    
    private func configureView() {
        self.view = self.carsView
    }
    
    private func fetchCars() {
        self.service.fetch { carsDTO in
            var cars = [Car]()
            cars.append(contentsOf: carsDTO.toCars)
            cars.append(contentsOf: carsDTO.toCars)
            cars.append(contentsOf: carsDTO.toCars)
            cars.append(contentsOf: carsDTO.toCars)
            self.carsView.reloadData(cars)
        }
    }
}

extension CarsViewController {
    
    class func buildSimpleList() -> CarsViewController {
        let adapter = CarsSimpleListAdapter()
        let navStyle = NavigationBarHide()
        let view = CarsView(listAdapter: adapter)
        let controller = CarsViewController(carsView: view,
                                            service: CarsWebService(),
                                            navigationStyle: navStyle)
        
        controller.tabBarItem.title = "Simple"
        controller.tabBarItem.image = UIImage(systemName: "list.bullet.rectangle")
        
        return controller
    }
    
    class func buildGridList() -> CarsViewController {
        let adapter = CarsGridListAdapter()
        let navStyle = NavigationBarHide()
        let view = CarsView(listAdapter: adapter)
        let controller = CarsViewController(carsView: view,
                                            service: CarsWebService(),
                                            navigationStyle: navStyle)
        controller.tabBarItem.title = "Grid"
        controller.tabBarItem.image = UIImage(systemName: "square.grid.3x3")
        
        return controller
    }
}
