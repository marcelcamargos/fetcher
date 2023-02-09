//
//  PresenterToViewMasterProtocol.swift
//  Fetcher
//
//  Created by Marcel Camargos on 07/02/23.
//

import Kingfisher

// MARK: View Output (Presenter -> View)
protocol PresenterToViewMasterProtocol: AnyObject {
    func onFetchMasterSuccess()
    func onFetchMasterFailure(error: String)
    
    func showHUD()
    func hideHUD()
    
    func onGetImagesFromURLSuccess(resources: [Resource])
    func onGetImagesFromURLFailure()
}
