//
//  CarsView.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 26/11/24.
//

import UIKit
import SwiftUI

class CarsView: UIView {
    
    private var listAdapter: CarsListAdapter
    
    private lazy var srcCars: UISearchBar = {
        let src = UISearchBar()
        src.delegate = self
        src.translatesAutoresizingMaskIntoConstraints = false
        return src
    }()
    
    private lazy var clvCars: UICollectionView = {
        let clv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        clv.translatesAutoresizingMaskIntoConstraints = false
        return clv
    }()
    
    init(listAdapter: CarsListAdapter) {
        self.listAdapter = listAdapter
        super.init(frame: .zero)
        self.addElements()
        self.configureAdapters()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        self.addSubview(self.srcCars)
        self.addSubview(self.clvCars)
        self.backgroundColor = .white
        NSLayoutConstraint.activate([
            self.srcCars.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.srcCars.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.srcCars.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.srcCars.bottomAnchor.constraint(equalTo: self.clvCars.topAnchor),
            self.clvCars.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.clvCars.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.clvCars.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func configureAdapters() {
        self.listAdapter.setCollectionView(self.clvCars)
    }
    
    func reloadData(_ datasource: [Car]) {
        print("reload")
        self.listAdapter.datasource = datasource
        self.clvCars.reloadData()
    }
}

extension CarsView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

struct CarsViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> CarsView {
        let carsDTO = [CarDTO.mock, CarDTO.mock, CarDTO.mock, CarDTO.mock]
        let listAdapter = CarsGridListAdapter()
        let view = CarsView(listAdapter: listAdapter)
        view.reloadData(carsDTO.toCars)
        return view
    }
    
    func updateUIView(_ uiView: CarsView, context: Context) { }
}

#Preview {
    CarsViewRepresentable()
}
