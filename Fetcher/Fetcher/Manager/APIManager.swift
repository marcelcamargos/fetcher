//
//  APIManager.swift
//  Fetcher
//
//  Created by Marcel Camargos on 07/02/23.
//

import Foundation

class APIManager {
    
    static let shared = { APIManager() }()
    
    private init() {}
    
    lazy var baseURL: String = {
        return "https://api.imgur.com/3/gallery/"
    }()
}
