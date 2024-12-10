//
//  CarsListAdapter.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 26/11/24.
//

import UIKit

protocol CarsListAdapter: AnyObject {
    var datasource: [Car] { get set }
    func setCollectionView(_ collectionView: UICollectionView)
}

















































//
//class CarsGridListAdapter: NSObject, CarsListAdapter {
//    
//    var datasource: [String] = []
//    
//    func setCollectionView(_ collectionView: UICollectionView) {
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Pepito")
//    }
//
//}
//
//extension CarsGridListAdapter: UITableViewDataSource {
//    
//}
//
//extension CarsGridListAdapter: UITableViewDelegate {
// 
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.datasource.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Pepito", for: indexPath)
//        let name = self.datasource[indexPath.row]
//        cell.textLabel?.text = name
//        cell.detailTextLabel?.text = name
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        90
//    }
//}
