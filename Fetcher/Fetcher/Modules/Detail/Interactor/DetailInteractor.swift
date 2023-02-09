//
//  DetailInteractor.swift
//  Fetcher
//
//  Created by Marcel Camargos on 07/02/23.
//

import UIKit

class DetailInteractor: PresenterToInteractorDetailProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterDetailProtocol?
    var uimage: UIImage?
    var name: String?
    
    func getImageDataFromURL() {
        print("Interactor receives the request from Presenter to get image data from the server.")
        self.presenter?.getImageFromURLSuccess(uiimage: uimage ?? UIImage(), name: name ?? String())
    }
}
