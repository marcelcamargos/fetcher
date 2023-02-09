//
//  PresenterToRouterMasterProtocol.swift
//  Fetcher
//
//  Created by Marcel Camargos on 07/02/23.
//

import UIKit

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterMasterProtocol: AnyObject {
    
    static func createModule() -> UINavigationController
    
    func pushToCatDetail(on view: PresenterToViewMasterProtocol, uimage: UIImage, name: String)
}
