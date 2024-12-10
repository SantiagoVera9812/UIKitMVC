//
//  CarDTO.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 4/12/24.
//

import Foundation

struct CarDTO: Decodable {
    let name: String?
    let brand: String?
    let releaseYear: String?
    let img: String?
}

extension CarDTO {
    static var mock: CarDTO {
        CarDTO(name: "S3",
               brand: "Audi",
               releaseYear: "2018-02-05",
               img: "https://i.ytimg.com/vi/stnSpI-ZQiA/maxresdefault.jpg")
    }
}

extension Array where Element == CarDTO {
    var toCars: [Car] {
        self.map({ Car(dto: $0) })
    }
}
