//
//  PresenterToInteractorMasterProtocol.swift
//  Fetcher
//
//  Created by Marcel Camargos on 07/02/23.
//

import Foundation

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorMasterProtocol: AnyObject {
    
    var presenter: InteractorToPresenterMasterProtocol? { get set }
    
    func loadCats()
    func retrieveCat(at index: Int)
    func getImageDataFromURLs(urls: [String])
}
