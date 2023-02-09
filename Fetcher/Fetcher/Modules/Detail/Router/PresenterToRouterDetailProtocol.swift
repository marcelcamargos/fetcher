//
//  PresenterToRouterDetailProtocol.swift
//  Fetcher
//
//  Created by Marcel Camargos on 08/02/23.
//

import UIKit

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterDetailProtocol: AnyObject {
    
    static func createModule(uimage: UIImage, name: String) -> UIViewController
}
