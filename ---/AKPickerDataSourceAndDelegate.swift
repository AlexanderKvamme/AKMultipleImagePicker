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
    private var currentlySelectedImages: [UIImage]? = nil
    
    // MARK: - Initializers
    
    override init() {
        super.init()
        setup()
    }
    
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
                    if let image = result {
                        self.imageArray.append(image)
                    }
                }
            }
        }
    }
 
    // MARK: Public methods
    
    func getSelectedImages() -> [UIImage]? {
        return currentlySelectedImages
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

extension AKPickerDataSourceAndDelegate: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedImageFromCell = (collectionView.cellForItem(at: indexPath)! as! AKImagePickerCell).getImage() else {
            print("ERROR: could not get image from cell. Should not mark as selected")
            return
        }
        
        if currentlySelectedImages == nil {
            currentlySelectedImages = [UIImage]()
        }

        currentlySelectedImages!.append(selectedImageFromCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard currentlySelectedImages != nil, let imageFromCell = (collectionView.cellForItem(at: indexPath)! as! AKImagePickerCell).getImage()  else { return }
        
        if let indexOfImage = currentlySelectedImages?.firstIndex(of: imageFromCell) {
            currentlySelectedImages!.remove(at: indexOfImage)
        }
    }
}

