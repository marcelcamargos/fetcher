//
//  PresenterToInteractorMasterProtocol.swift
//  Fetcher
//
//  Created by Marcel Camargos on 07/02/23.
//

import UIKit
import Kingfisher

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorMasterProtocol: AnyObject {
    
    var presenter: InteractorToPresenterMasterProtocol? { get set }
    
    func loadCats()
    func retrieveCat(uimage: UIImage, url: Resource)
    func getImageDataFromURLs(urls: [String])
}
