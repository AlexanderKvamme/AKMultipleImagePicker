//
//  ViewController.swift
//  AKMultipleImagePicker
//
//  Created by Amia Macone on 17/12/2018.
//  Copyright © 2018 Amia Macone. All rights reserved.
//

import UIKit
import SnapKit


class AKMultipleImagePickerController: UIViewController {

    // MARK: - Properties
    
    private var imagePickerCollectionView: AKImageCollectionView!
    private var dataSourceAndDelegate: AKPickerDataSourceAndDelegate!
    
    // MARK: - Initializers

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    // MARK: - Methods
    
    private func setup() {
        // Self
        view.backgroundColor = .purple
        
        // dataSource
        dataSourceAndDelegate = AKPickerDataSourceAndDelegate()
        
        // CollectionView and layout
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.estimatedItemSize = CGSize(width: 100, height: 100)
        imagePickerCollectionView = AKImageCollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewLayout)
        imagePickerCollectionView.dataSource = dataSourceAndDelegate
        imagePickerCollectionView.delegate = dataSourceAndDelegate
        imagePickerCollectionView.register(AKImagePickerCell.self, forCellWithReuseIdentifier: AKImagePickerCell.reuseIdentifier)
        imagePickerCollectionView.allowsSelection = true
        imagePickerCollectionView.allowsMultipleSelection = true
        
        // addSubviewsAndConstraints
        view.addSubview(imagePickerCollectionView)
        
        imagePickerCollectionView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(40)
            make.left.right.bottom.equalTo(view)
        }
    }
}

