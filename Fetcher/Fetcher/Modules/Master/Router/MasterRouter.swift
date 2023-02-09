//
//  MasterRouter.swift
//  Fetcher
//
//  Created by Marcel Camargos on 07/02/23.
//

import UIKit

class MasterRouter: PresenterToRouterMasterProtocol {
    
    // MARK: Static methods
    static func createModule() -> UINavigationController {
        
        print("CatsRouter creates the Cats module.")
        let viewController = MasterViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let presenter: ViewToPresenterMasterProtocol & InteractorToPresenterMasterProtocol = MasterPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = MasterRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = MasterInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }
    
    // MARK: - Navigation
    func pushToCatDetail(on view: PresenterToViewMasterProtocol, with cat: Cat) {
        print("CatsRouter is instructed to push DetailViewController onto the navigation stack.")
        let detailViewController = DetailRouter.createModule(with: cat)

        let viewController = view as? MasterViewController
        viewController?.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
