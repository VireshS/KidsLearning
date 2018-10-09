//
//  CustomCollectionViewFlowLayout.swift
//  Just Have Fun
//
//  Created by Singh, Viresh on 08/10/18.
//  Copyright © 2018 Honeywell. All rights reserved.
//

import UIKit

class CustomCollectionViewFlowLayout: UICollectionViewFlowLayout {

    
    override func prepare() {
        
    }
    
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        if var attributes = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath)
        {
            attributes.center = CGPoint(x: 1000, y: self.collectionView!.center.y)
            return attributes
        }
        return nil
    }
}
