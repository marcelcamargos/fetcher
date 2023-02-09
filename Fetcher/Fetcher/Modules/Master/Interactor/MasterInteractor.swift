//
//  MasterInteractor.swift
//  Fetcher
//
//  Created by Marcel Camargos on 07/02/23.
//

import Foundation
import Kingfisher

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
    
    func retrieveCat(uimage: UIImage, url: Resource) {
        guard let cats = self.cats else {
            self.presenter?.getCatFailure()
            return
        }
        for cat in cats.data ?? [] {
            for ct in cat.images ?? [] {
                if ct.link == url.downloadURL.absoluteString {
                    self.presenter?.getCatSuccess(uimage: uimage, name: cat.tags?.count ?? -1 > 0 ? cat.tags?[0].display_name ?? "" : "")
                }
            }
        }
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
