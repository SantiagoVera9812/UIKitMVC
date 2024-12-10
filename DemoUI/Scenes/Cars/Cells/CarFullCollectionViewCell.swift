//
//  CarsFullCollectionViewCell.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 26/11/24.
//

import UIKit
import Alamofire

class CarFullCollectionViewCell: UICollectionViewCell {
    
    private var car: Car?
    
    private lazy var lblInfo: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.textColor = .darkGray
        lbl.font = .systemFont(ofSize: 18, weight: .semibold)
        return lbl
    }()
    
    private lazy var lblReleaseDateInfo: UILabel = {
        let lbl = UILabel()
        lbl.text = "Fecha de lanzamiento:"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.textColor = .darkGray
        lbl.font = .systemFont(ofSize: 15, weight: .light)
        return lbl
    }()
    
    private lazy var lblReleaseDate: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.textColor = .darkGray
        lbl.font = .systemFont(ofSize: 15, weight: .light)
        return lbl
    }()
    
    private lazy var imgCar: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .systemIndigo
        img.widthAnchor.constraint(equalToConstant: 180).isActive = true
        img.heightAnchor.constraint(equalTo: img.widthAnchor, multiplier: 0.8).isActive = true
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    private lazy var stkReleaseDate = VerticalStack(subViews: [self.lblReleaseDateInfo, self.lblReleaseDate], spacing: 3)
    private lazy var stkInfo = VerticalStack(subViews: [self.lblInfo, self.stkReleaseDate],
                                             spacing: 3,
                                             margins: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    private lazy var stkContent = HorizontalStack(subViews: [self.imgCar, self.stkInfo], distribution: .fill, spacing: 0)
    
    private func setupCell() {
        
        self.backgroundColor = .clear
        self.stkContent.backgroundColor = .white
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.3
        self.stkContent.layer.cornerRadius = 8
        self.stkContent.clipsToBounds = true
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
        self.lblReleaseDate.text = car.releaseDateFullFormat
//        self.imgCar.loadImageIn(car.urlImage) { image, urlString in
//            if urlString == self.car?.urlImage {
//                self.imgCar.image = image
//            }
//        }
    }
    
    func animate() {
        self.transform = CGAffineTransform.init(translationX: 100, y: 0).scaledBy(x: 0.8, y: 0.8)
        self.alpha = 0.5
        self.layoutIfNeeded()
        
        UIView.animate(withDuration: 1) {
            self.transform = .identity
            self.alpha = 1
            self.layoutIfNeeded()
        }
    }
}

extension CarFullCollectionViewCell {
    
    class var identifier: String { "CarFullCollectionViewCell" }
    
    class func buildIn(_ collectionView: UICollectionView, indexPath: IndexPath, car: Car) -> Self {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.identifier,
                                                      for: indexPath) as? Self
        cell?.updateWith(car)
        return cell ?? Self()
    }
}
