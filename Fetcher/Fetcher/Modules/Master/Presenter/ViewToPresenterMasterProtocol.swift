//
//  ViewToPresenterMasterProtocol.swift
//  Fetcher
//
//  Created by Marcel Camargos on 07/02/23.
//

import Foundation
import Kingfisher

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterMasterProtocol: AnyObject {
    
    var view: PresenterToViewMasterProtocol? { get set }
    var interactor: PresenterToInteractorMasterProtocol? { get set }
    var router: PresenterToRouterMasterProtocol? { get set }
    
    var quotesStrings: [String]? { get set }
    
    func viewDidLoad()
    
    func refresh()
    
    func numberOfRowsInSection() -> Int
    func getImageResource(indexPath: IndexPath) -> Resource
    
    func didSelectRowAt(index: Int)
    //func deselectRowAt(index: Int)

}
