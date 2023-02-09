//
//  InteractorToPresenterMasterProtocol.swift
//  Fetcher
//
//  Created by Marcel Camargos on 07/02/23.
//

import Kingfisher

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterMasterProtocol: AnyObject {
    
    func fetchCatsSuccess(cats: Cats)
    func fetchCatsFailure(errorCode: Int)
    
    func getCatSuccess(uimage: UIImage, name: String)
    func getCatFailure()
    
    func getImageFromURLSuccess(resources: [Resource])
    func getImageFromURLFailure()
}
