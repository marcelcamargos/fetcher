//
//  APIClient.swift
//  Fetcher
//
//  Created by Marcel Camargos on 07/02/23.
//

import Foundation
import Alamofire

class APIClient {
    
    var baseURL: URL?
    
    static let shared = { APIClient(baseUrl: APIManager.shared.baseURL) }()
    
    required init(baseUrl: String) {
        self.baseURL = URL(string: baseUrl)
    }
    
    func getArray(urlString: String,
                  success: @escaping (Int, Cats) -> (),
                  failure: @escaping (Int) -> ()) {
        
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Client-ID 1ceddedc03a5d71"
        ]
        
        guard let url = NSURL(string: urlString , relativeTo: self.baseURL as URL?) else {
            return
        }
        
        guard let urlString = url.absoluteString else { return }
        
        Alamofire
            .request(urlString,
                     method: .get,
                     encoding: JSONEncoding.default,
                     headers: headers)
            .responseJSON { dataResponse in
                
                guard let serverResponse = dataResponse.response,
                      let _ = dataResponse.result.value else {
                    failure(400)
                    return
                }
                
                switch serverResponse.statusCode {
                case 200, 201:
                    guard let data = dataResponse.data else { return }
                    do {
                        let decoder = JSONDecoder()
                        let resp = try decoder.decode(Cats.self, from: data)
                        success(serverResponse.statusCode, resp)
                    } catch let error {
                        print(error)
                        failure(serverResponse.statusCode)
                    }
                default:
                    failure(serverResponse.statusCode)
                }
            }
    }
}
