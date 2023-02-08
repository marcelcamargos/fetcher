//
//  KingfisherService.swift
//  Fetcher
//
//  Created by Marcel Camargos on 07/02/23.
//

import Foundation
import Kingfisher

class KingfisherService {
    
    static let shared = { KingfisherService() }()
    
    private init() {}
    
    func loadImageFrom(urlString: String,
                       success: @escaping (Data) -> (),
                       failure: @escaping (KingfisherError) -> ()) {
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        ImageDownloader.default.downloadImage(with: url, options: nil, progressBlock: nil) { result in
            switch result {
            case .success(let value):
                print("Data: \(value.originalData)")
                success(value.originalData)
            case .failure(let error):
                print("Error: \(error)")
                failure(error)
            }
        }
    }
    
    func loadImageFrom(urlStrings: [String],
                       success: @escaping ([Resource]) -> (),
                       failure: @escaping (KingfisherError) -> ()) {
        
        var urls: [URL] = []
        for url in urlStrings {
            guard let u = URL(string: url) else { return }
            urls.append(u)
        }
        
        let prefetcher = ImagePrefetcher(urls: urls) {
            skippedResources, failedResources, completedResources in
            success(completedResources.isEmpty ? skippedResources : [])
        }
        prefetcher.start()
    }
}

