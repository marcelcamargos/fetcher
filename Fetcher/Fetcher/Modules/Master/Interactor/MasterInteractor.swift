//
//  MasterInteractor.swift
//  Fetcher
//
//  Created by Marcel Camargos on 07/02/23.
//

import Foundation

class MasterInteractor: PresenterToInteractorMasterProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterMasterProtocol?
    var cats: Cats?
    
    init(presenter: InteractorToPresenterMasterProtocol? = nil, cats: Cats? = nil) {
        self.presenter = presenter
        self.cats = cats
    }
    
    func loadCats() {
        print("Interactor receives the request from Presenter to load cats from the server.")
        CatService.shared.getCats(count: 6, success: { (code, cats) in
            self.cats = cats
            self.presenter?.fetchCatsSuccess(cats: cats)
        }) { (code) in
            self.presenter?.fetchCatsFailure(errorCode: code)
        }
    }
    
    func retrieveCat(at index: Int) {
        guard let cats = self.cats, ((cats.data?.indices.contains(index)) != nil) else {
            self.presenter?.getCatFailure()
            return
        }
        self.presenter?.getCatSuccess(self.cats?.data?[index] ?? Cat())
    }
    
    func getImageDataFromURLs(urls: [String]) {
        print("Interactor receives the request from Presenter to get image data from the server.")
        KingfisherService.shared.loadImageFrom(urlStrings: urls, success: { (resources) in
            self.presenter?.getImageFromURLSuccess(resources: resources)
        }) { (error) in
            self.presenter?.getImageFromURLFailure()
        }
    }
}
