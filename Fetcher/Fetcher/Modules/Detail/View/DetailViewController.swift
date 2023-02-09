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
        return imageView
    }()
    
    lazy var catNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
}

extension DetailViewController: PresenterToViewDetailProtocol {
    
    func onGetImageFromURLSuccess(_ catName: String, image: UIImage) {
        print("View receives the response from Presenter and updates itself.")
        catNameLabel.text = catName
        characterImageView.image = image
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
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.widthAnchor.constraint(equalToConstant: widthHeightConstant).isActive = true
        characterImageView.heightAnchor.constraint(equalToConstant: widthHeightConstant).isActive = true
        characterImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        characterImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        catNameLabel.translatesAutoresizingMaskIntoConstraints = false
        catNameLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        catNameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor).isActive = true
        catNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
}
