//
//  DetailInteractor.swift
//  Fetcher
//
//  Created by Marcel Camargos on 07/02/23.
//

import Foundation

class DetailInteractor: PresenterToInteractorDetailProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterDetailProtocol?
    var cat: Cat?
    
    func getImageDataFromURL() {
        print("Interactor receives the request from Presenter to get image data from the server.")
        KingfisherService.shared.loadImageFrom(urlString: cat?.images?[0].link ?? "", success: { (data) in
            self.presenter?.getImageFromURLSuccess(cat: self.cat ?? Cat(), data: data)
        }) { (error) in
            self.presenter?.getImageFromURLFailure(cat: self.cat ?? Cat())
        }
    }
}
