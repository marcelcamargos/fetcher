//
//  ViewToPresenterDetailProtocol.swift
//  Fetcher
//
//  Created by Marcel Camargos on 08/02/23.
//

import Foundation

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterDetailProtocol: AnyObject {
    
    var view: PresenterToViewDetailProtocol? { get set }
    var interactor: PresenterToInteractorDetailProtocol? { get set }
    var router: PresenterToRouterDetailProtocol? { get set }

    func viewDidLoad()
}
