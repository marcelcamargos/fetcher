//
//  MasterPresenter.swift
//  Fetcher
//
//  Created by Marcel Camargos on 07/02/23.
//

import Kingfisher
import UIKit

class MasterPresenter: ViewToPresenterMasterProtocol {
    
    // MARK: Properties
    weak var view: PresenterToViewMasterProtocol?
    var interactor: PresenterToInteractorMasterProtocol?
    var router: PresenterToRouterMasterProtocol?
    
    var quotesStrings: [String]?
    var urls: [String] = []
    var resources: [Resource]?
    
    init(view: PresenterToViewMasterProtocol? = nil, interactor: PresenterToInteractorMasterProtocol? = nil, router: PresenterToRouterMasterProtocol? = nil, urls: [String]? = []) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.urls = urls ?? []
    }
    
    // MARK: Inputs from view
    func viewDidLoad() {
        print("Presenter is being notified that the View was loaded.")
        view?.showHUD()
        interactor?.loadCats()
    }
    
    func refresh() {
        print("Presenter is being notified that the View was refreshed.")
        interactor?.loadCats()
    }
    
    func numberOfRowsInSection() -> Int {
        return resources?.count ?? 0
    }
    
    func getImageResource(indexPath: IndexPath) -> Resource {
        guard let resources = self.resources else {
            return ImageResource(downloadURL: URL(fileURLWithPath: ""))
        }
        
        return resources[indexPath.row]
    }
    
    func didSelectRowAt(uimage: UIImage, url: Resource) {
        interactor?.retrieveCat(uimage: uimage, url: url)
    }
    
//    func deselectRowAt(index: Int) {
//        view?.deselectRowAt(row: index)
//    }
}

// MARK: - Outputs to view
extension MasterPresenter: InteractorToPresenterMasterProtocol {
    
    func fetchCatsSuccess(cats: Cats) {
        print("Presenter receives the result from Interactor after it's done its job.")
        for cat in cats.data ?? [] {
            for img in cat.images ?? [] {
                if !(img.link?.isEmpty ?? true) {
                    urls.append(img.link ?? "")
                    break
                }
            }
        }
        interactor?.getImageDataFromURLs(urls: urls)
    }
    
    func fetchCatsFailure(errorCode: Int) {
        print("Presenter receives the result from Interactor after it's done its job.")
        view?.hideHUD()
        view?.onFetchMasterFailure(error: "Couldn't fetch cats: \(errorCode)")
    }
    
    func getCatSuccess(uimage: UIImage, name: String) {
        router?.pushToCatDetail(on: view ?? MasterViewController(), uimage: uimage, name: name)
    }
    
    func getCatFailure() {
        view?.hideHUD()
        print("Couldn't retrieve quote by index")
    }
    
    func getImageFromURLSuccess(resources: [Resource]) {
        print("resources prefetched: \(resources)")

        //view?.onGetImagesFromURLSuccess(resources: resources)
        
        self.resources = resources
        
        view?.hideHUD()
        view?.onFetchMasterSuccess()
    }
    
    func getImageFromURLFailure() {
        view?.hideHUD()
        print("resources prefetched failure")
        //view?.onGetImagesFromURLFailure()
    }
}
