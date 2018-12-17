//
//  AKPickerDataSourceAndDelegate.swift
//  AKMultipleImagePicker
//
//  Created by Amia Macone on 17/12/2018.
//  Copyright © 2018 Amia Macone. All rights reserved.
//

import Foundation
import UIKit


final class AKPickerDataSourceAndDelegate: NSObject, UICollectionViewDataSource {

    // MARK: - Properties
    
    // MARK: - Initializers
    
    // MARK: - Life Cycle
    
    // MARK: - Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: AKImagePickerCell.reuseIdentifier, for: indexPath) as? AKImagePickerCell ?? AKImagePickerCell()
        return imageCell
    }
}

// MARK: - Protocol Conformance: UICollectionViewDelegate

extension AKPickerDataSourceAndDelegate: UICollectionViewDelegate {
    
}
