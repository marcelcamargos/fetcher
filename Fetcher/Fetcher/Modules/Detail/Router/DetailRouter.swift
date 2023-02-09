//
//  DetailRouter.swift
//  Fetcher
//
//  Created by Marcel Camargos on 07/02/23.
//

import UIKit

class DetailRouter: PresenterToRouterDetailProtocol {
    
    // MARK: Static methods
    static func createModule(with cat: Cat) -> UIViewController {
        print("DetailRouter creates the Detail module.")
        let viewController = DetailViewController()
        
        let presenter: ViewToPresenterDetailProtocol & InteractorToPresenterDetailProtocol = DetailPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = DetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = DetailInteractor()
        viewController.presenter?.interactor?.cat = cat
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
