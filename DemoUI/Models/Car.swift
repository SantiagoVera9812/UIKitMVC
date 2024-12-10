//
//  Car.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 26/11/24.
//

import Foundation

struct Car {
    let name: String
    let brand: String
    let urlImage: String
    private let releaseDate: Date?
    
    var releaseDateFullFormat: String {
        self.releaseDate?.toStringWithFormat("EEEE dd 'de' MMMM 'del' yyyy") ?? "Próximamente"
    }
    
    var releaseDateShortFormat: String {
        self.releaseDate?.toStringWithFormat("dd MMMM yyyy") ?? "Próximamente"
    }
    
    var info: String {
        "\(self.brand) • \(self.name)"
    }
    
    init(dto: CarDTO) {
        self.name = dto.name ?? ""
        self.brand = dto.brand ?? ""
        self.urlImage = dto.img ?? ""
        self.releaseDate = dto.releaseYear?.toDateWithFormat("yyyy-MM-dd")
    }
}
