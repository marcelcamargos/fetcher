//
//  PresenterToViewDetailProtocol.swift
//  Fetcher
//
//  Created by Marcel Camargos on 08/02/23.
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewDetailProtocol: AnyObject {
    
    func onGetImageFromURLSuccess(_ catName: String, image: UIImage)
    func onGetImageFromURLFailure(_ catName: String)
}
