//
//  InteractorToPresenterDetailProtocol.swift
//  Fetcher
//
//  Created by Marcel Camargos on 08/02/23.
//

import Foundation

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterDetailProtocol: AnyObject {
    
    func getImageFromURLSuccess(cat: Cat, data: Data?)
    func getImageFromURLFailure(cat: Cat)
}
