//
//  ImageCell.swift
//  Fetcher
//
//  Created by Marcel Camargos on 07/02/23.
//

import UIKit
import Kingfisher

class ImageCell: UICollectionViewCell {
    
    static let id = "cell"
    
    let photoImageView: UIImageView = {
        let iv =  UIImageView(frame: CGRect.zero)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.isUserInteractionEnabled = false
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        contentView.addSubview(photoImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            photoImageView.widthAnchor.constraint(equalTo: widthAnchor),
            photoImageView.heightAnchor.constraint(equalTo: heightAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
    }
    
    func configure(_ url: Resource) {
        photoImageView.kf.setImage(with: url)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
