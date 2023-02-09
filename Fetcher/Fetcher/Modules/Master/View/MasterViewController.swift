//
//  MasterViewController.swift
//  Fetcher
//
//  Created by Marcel Camargos on 07/02/23.
//

import UIKit
import PKHUD
import Kingfisher

class MasterViewController: UIViewController {
    
    var presenter: ViewToPresenterMasterProtocol?
    
    // MARK: - UI
    lazy var gridCollectionView: UICollectionView = {
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: GridLayout())
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.id)
        return collectionView
    }()
    
    lazy var fullImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.lightGray
        imageView.isUserInteractionEnabled = true
        imageView.alpha = 0
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let dismissWithTap = UITapGestureRecognizer(target: self, action: #selector(hideFullImage))
        imageView.addGestureRecognizer(dismissWithTap)
        return imageView
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    
    // MARK: - App Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUI()
        presenter?.viewDidLoad()
    }
    
    // MARK:- Animation
    func showFullImage(of image: UIImage) {
        fullImageView.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations:{
            self.fullImageView.image = image
            self.fullImageView.alpha = 1
            self.fullImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
    
    @objc func hideFullImage() {
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations:{
            self.fullImageView.alpha = 0
        }, completion: nil)
    }
    
    // MARK: - Actions
    @objc func refresh() {
        presenter?.refresh()
    }
}

extension MasterViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.id, for: indexPath) as? ImageCell else {
            return UICollectionViewCell()
        }
        guard let url = presenter?.getImageResource(indexPath: indexPath) else { return UICollectionViewCell() }
        cell.configure(url)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? ImageCell,
              let image = cell.photoImageView.image else { return }
        //self.showFullImage(of: image)
        guard let url = presenter?.getImageResource(indexPath: indexPath) else { return }
        presenter?.didSelectRowAt(uimage: image, url: url)
    }
}

extension MasterViewController: PresenterToViewMasterProtocol {
    
    func onFetchMasterSuccess() {
        print("View receives the response from Presenter and updates itself.")
        self.gridCollectionView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    func onFetchMasterFailure(error: String) {
        print("View receives the response from Presenter with error: \(error)")
        self.refreshControl.endRefreshing()
    }
    
    func showHUD() {
        HUD.show(.progress, onView: self.view)
    }
    
    func hideHUD() {
        HUD.hide()
    }
    
    //func deselectRowAt(row: Int) {
        //self.tableView.deselectRow(at: IndexPath(row: row, section: 0), animated: true)
    //}
    
    func onGetImagesFromURLSuccess(resources: [Resource]) {
        self.gridCollectionView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    func onGetImagesFromURLFailure() {
        
    }
}

extension MasterViewController {
    func setupUI() {
        self.view.addSubview(gridCollectionView)
        gridCollectionView.addSubview(refreshControl)
        self.view.addSubview(fullImageView)
        
        NSLayoutConstraint.activate([
            gridCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            gridCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            gridCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gridCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            fullImageView.topAnchor.constraint(equalTo: view.topAnchor),
            fullImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            fullImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fullImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
