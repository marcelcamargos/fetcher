//
//  CatDataService.swift
//  Fetcher
//
//  Created by Marcel Camargos on 07/02/23.
//

import UIKit

class CatDataService {
    
    static let shared = { CatDataService() }()
    
    private init() {}
    
    func convertToUIImage(from data: Data) -> UIImage {
        return UIImage(data: data) ?? UIImage()
    }
}
