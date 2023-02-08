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
//    func pushToQuoteDetail(on view: PresenterToViewMasterProtocol, with quote: Quote) {
//        print("QuotesRouter is instructed to push QuoteDetailViewController onto the navigation stack.")
//        let quoteDetailViewController = QuoteDetailRouter.createModule(with: quote)
//
//        let viewController = view as? QuotesViewController
//        viewController?.navigationController?.pushViewController(quoteDetailViewController, animated: true)
//    }
}
