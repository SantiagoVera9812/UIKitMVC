//
//  CarShortCollectionViewCell.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 28/11/24.
//

import UIKit
import Alamofire

class CarShortCollectionViewCell: UICollectionViewCell {
    
    private var car: Car?
    
    private lazy var lblInfo: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.textColor = .darkGray
        lbl.font = .systemFont(ofSize: 18, weight: .semibold)
        lbl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return lbl
    }()
    
    private lazy var imgCar: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .systemIndigo
        img.heightAnchor.constraint(equalTo: img.widthAnchor, multiplier: 0.5).isActive = true
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    private lazy var stkContent = VerticalStack(subViews: [self.imgCar, self.lblInfo], spacing: 5)
    
    private func setupCell() {
        
        self.backgroundColor = .clear
        self.stkContent.backgroundColor = .white
        self.imgCar.layer.cornerRadius = 8
        self.addSubview(self.stkContent)
        
        NSLayoutConstraint.activate([
            self.stkContent.topAnchor.constraint(equalTo: self.topAnchor),
            self.stkContent.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.stkContent.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stkContent.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateWith(_ car: Car) {
        self.car = car
        self.lblInfo.text = car.info
        self.imgCar.loadImageIn(car.urlImage) { image, urlString in
            if urlString == self.car?.urlImage {
                self.imgCar.image = image
            }
        }
    }
}

extension CarShortCollectionViewCell {
    
    class var identifier: String { "CarShortCollectionViewCell" }
    
    class func buildIn(_ collectionView: UICollectionView, indexPath: IndexPath, car: Car) -> Self {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.identifier,
                                                      for: indexPath) as? Self
        cell?.updateWith(car)
        return cell ?? Self()
    }
}
