//
//  CarsWebService.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 4/12/24.
//

import Alamofire
import Foundation

protocol CarsWebServiceProtocol {
    typealias Success = (_ carsDTO: [CarDTO]) -> Void
    func fetch(_ success: @escaping Success)
}

struct CarsWebService: CarsWebServiceProtocol {
    
    var urlString = Environment.baseURL + "v3/ab7df46c-0c8c-493c-9489-77a803c8252c"
    
    func fetch(_ success: @escaping Success) {
        AF.request(urlString, method: .get).response { dataResponse in
            guard let data = dataResponse.data else {
                success([])
                return
            }
            
            do {
                let response = try JSONDecoder().decode([CarDTO].self, from: data)
                success(response)
            } catch {
                success([])
            }
        }
    }
}

struct CarsWebServiceMock: CarsWebServiceProtocol {
    func fetch(_ success: @escaping Success) {
        success([CarDTO.mock, CarDTO.mock, CarDTO.mock, CarDTO.mock])
    }
}
