//
//  CarsSimpleListAdapter.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 26/11/24.
//

import UIKit

class CarsSimpleListAdapter: NSObject, CarsListAdapter {
    
    private weak var collectionView: UICollectionView?
    var datasource: [Car] = []
    
    func setCollectionView(_ collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.register(CarFullCollectionViewCell.self, forCellWithReuseIdentifier: CarFullCollectionViewCell.identifier)
        self.collectionView?.collectionViewLayout = self.layout()
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(140))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(140))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
            
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 12
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension CarsSimpleListAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        CarFullCollectionViewCell.buildIn(collectionView, indexPath: indexPath, car: self.datasource[indexPath.row])
    }
}

extension CarsSimpleListAdapter: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CarFullCollectionViewCell
        cell?.animate()
    }
}
