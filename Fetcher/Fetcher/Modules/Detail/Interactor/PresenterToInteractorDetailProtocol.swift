//
//  PresenterToInteractorDetailProtocol.swift
//  Fetcher
//
//  Created by Marcel Camargos on 08/02/23.
//

import Foundation

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorDetailProtocol: AnyObject {
    
    var presenter: InteractorToPresenterDetailProtocol? { get set }
    
    var cat: Cat? { get set }
    
    func getImageDataFromURL()
}
