//
//  CarsGridListAdapter.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 28/11/24.
//

import UIKit

class CarsGridListAdapter: NSObject, CarsListAdapter {
    
    private weak var collectionView: UICollectionView?
    var datasource: [Car] = []
    
    func setCollectionView(_ collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.register(CarShortCollectionViewCell.self, forCellWithReuseIdentifier: CarShortCollectionViewCell.identifier)
        self.collectionView?.collectionViewLayout = self.layout()
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let numberOfColumns: Int = 2
        let fractionalWidth: CGFloat = 1 / CGFloat(numberOfColumns)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fractionalWidth), heightDimension: .estimated(80))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: numberOfColumns)
        group.interItemSpacing = .fixed(8)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 12
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension CarsGridListAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        CarShortCollectionViewCell.buildIn(collectionView, indexPath: indexPath, car: self.datasource[indexPath.row])
    }
}

extension CarsGridListAdapter: UICollectionViewDelegate {
 
}
