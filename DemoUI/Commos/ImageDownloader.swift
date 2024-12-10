//
//  ImageDownloader.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 5/12/24.
//

import UIKit
import Alamofire

extension UIImageView {
    
    typealias Completion = (_ image: UIImage?, _ urlString: String) -> Void
    
    func loadImageIn(_ urlString: String, placeHolder: UIImage? = nil, completion: Completion? = nil) {
        self.image = placeHolder
        
        AF.request(urlString).response { responseData in
            guard let data = responseData.data else {
                
                if let completion = completion {
                    completion(placeHolder, urlString)
                } else {
                    self.image = placeHolder
                }
                return
            }
            
            DispatchQueue.global(qos: .background).async {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    if let completion = completion {
                        completion(image ?? placeHolder, urlString)
                    } else {
                        self.image = image ?? placeHolder
                    }
                }
            }
        }
    }
}
