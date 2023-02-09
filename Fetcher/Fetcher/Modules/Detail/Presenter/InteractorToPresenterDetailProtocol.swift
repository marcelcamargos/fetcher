//
//  InteractorToPresenterDetailProtocol.swift
//  Fetcher
//
//  Created by Marcel Camargos on 08/02/23.
//

import UIKit

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterDetailProtocol: AnyObject {
    
    func getImageFromURLSuccess(uiimage: UIImage, name: String)
    func getImageFromURLFailure(cat: Cat)
}
