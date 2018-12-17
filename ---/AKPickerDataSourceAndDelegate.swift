//
//  AKPickerDataSourceAndDelegate.swift
//  AKMultipleImagePicker
//
//  Created by Amia Macone on 17/12/2018.
//  Copyright © 2018 Amia Macone. All rights reserved.
//

import Foundation
import UIKit
import Photos


final class AKPickerDataSourceAndDelegate: NSObject {

    // MARK: - Properties
    
    private let imageManager = PHImageManager.default()
    private let itemSize = CGSize(width: 100, height: 100)
    private var imageArray = [UIImage]()
    
    // MARK: - Initializers
    
    override init() {
        super.init()
        setup()
    }
    
    // MARK: - Life Cycle
    
    // MARK: - Methods
    
    private func setup() {
        grabPhotos()
    }
    
    private func grabPhotos() {
        // request- and fetch options
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        requestOptions.deliveryMode = .opportunistic
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)] // brukerens siste  bilde vises først

        // Fetch images
        let fetchedAssets = PHAsset.fetchAssets(with: .image, options: fetchOptions)

        if fetchedAssets.count > 0 {
            for i in 0..<fetchedAssets.count {
                imageManager.requestImage(for: fetchedAssets.object(at: i), targetSize: itemSize, contentMode: .aspectFill, options: requestOptions) { (result, info) in
                    print("got image: ", result)
                    if let image = result {
                        self.imageArray.append(image)
                    }
                }
            }
        }
    }
}

// MARK: - Protocol Conformance: UICollectionViewDataSource

extension AKPickerDataSourceAndDelegate: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: AKImagePickerCell.reuseIdentifier, for: indexPath) as? AKImagePickerCell ?? AKImagePickerCell()
        imageCell.update(with: imageArray[indexPath.row])
        return imageCell
    }
}

// MARK: - Protocol Conformance: UICollectionViewDelegate

//extension AKPickerDataSourceAndDelegate: UICollectionViewDelegate {
//
//}

