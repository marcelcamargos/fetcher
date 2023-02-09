//
//  DetailViewController.swift
//  Fetcher
//
//  Created by Marcel Camargos on 07/02/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        presenter?.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterDetailProtocol?
    
    lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var catNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

extension DetailViewController: PresenterToViewDetailProtocol {
    
    func onGetImageFromURLSuccess(uiimage: UIImage, name: String) {
        print("View receives the response from Presenter and updates itself.")
        catNameLabel.text = name
        characterImageView.image = uiimage
    }
    
    func onGetImageFromURLFailure(_ catName: String) {
        print("View receives the response from Presenter and updates itself.")
        catNameLabel.text = catName
    }
}

// MARK: - UI Setup
extension DetailViewController {
    func setupUI() {
        overrideUserInterfaceStyle = .light
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(characterImageView)
        self.view.addSubview(catNameLabel)
        
        let widthHeightConstant = self.view.frame.width * 0.8
        
        characterImageView.widthAnchor.constraint(equalToConstant: widthHeightConstant).isActive = true
        characterImageView.heightAnchor.constraint(equalToConstant: widthHeightConstant).isActive = true
        characterImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        characterImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        catNameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 20).isActive = true
        catNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
}
