//
//  PresenterToInteractorDetailProtocol.swift
//  Fetcher
//
//  Created by Marcel Camargos on 08/02/23.
//

import UIKit

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorDetailProtocol: AnyObject {
    
    var presenter: InteractorToPresenterDetailProtocol? { get set }
    
    var uimage: UIImage? { get set }
    var name: String? { get set }
    
    func getImageDataFromURL()
}
