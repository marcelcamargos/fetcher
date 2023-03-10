//
//  DetailPresenter.swift
//  Fetcher
//
//  Created by Marcel Camargos on 07/02/23.
//

import Foundation
import UIKit

class DetailPresenter: ViewToPresenterDetailProtocol {

    // MARK: Properties
    weak var view: PresenterToViewDetailProtocol?
    var interactor: PresenterToInteractorDetailProtocol?
    var router: PresenterToRouterDetailProtocol?
    
    func viewDidLoad() {
        print("Presenter is being notified that the View was loaded.")
        interactor?.getImageDataFromURL()
    }
}

extension DetailPresenter: InteractorToPresenterDetailProtocol {
    
    func getImageFromURLSuccess(uiimage: UIImage, name: String) {
        print("Presenter receives the result from Interactor after it's done its job.")

        view?.onGetImageFromURLSuccess(uiimage: uiimage, name: name)
    }
    
    func getImageFromURLFailure(cat: Cat) {
        print("Presenter receives the result from Interactor after it's done its job.")
        view?.onGetImageFromURLFailure(!(cat.tags?.isEmpty ?? true) ? (cat.tags?[0].display_name ?? "") : "")
    }
}
