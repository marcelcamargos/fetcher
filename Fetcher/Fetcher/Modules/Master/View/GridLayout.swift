//
//  GridLayout.swift
//  Fetcher
//
//  Created by Marcel Camargos on 07/02/23.
//

import UIKit

class GridLayout: UICollectionViewFlowLayout {
    
    let innerSpace: CGFloat = 2.0
    let numberOfCellsOnRow: CGFloat = 3
    
    override init() {
        super.init()
        self.minimumLineSpacing = innerSpace
        self.minimumInteritemSpacing = innerSpace
        self.scrollDirection = .vertical
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func itemWidth() -> CGFloat {
        return ((collectionView?.frame.size.width ?? 1)/self.numberOfCellsOnRow) - self.innerSpace
    }
    
    override var itemSize: CGSize {
        set {
            self.itemSize = CGSize(width: itemWidth(), height: itemWidth())
        }
        get {
            return CGSize(width: itemWidth(), height: itemWidth())
        }
    }
}
