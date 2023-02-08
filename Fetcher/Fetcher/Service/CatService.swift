//
//  CatService.swift
//  Fetcher
//
//  Created by Marcel Camargos on 07/02/23.
//

class CatService {
    
    static let shared = { CatService() }()
    
    func getCats(count: Int, success: @escaping (Int, Cats) -> (), failure: @escaping (Int) -> ()) {
        
        let urlString = self.configureApiCall(Endpoints.SEARCH, "q", "cats")
        
        APIClient.shared.getArray(urlString: urlString, success: { (code, cats) in
            success(code, cats)
            
        }) { (code) in
            failure(code)
        }
    }
    
    func configureApiCall(_ baseURL: String, _ parameter: String, _ value: String) -> String {
        return baseURL + "?" + parameter + "=" + value
    }
}
