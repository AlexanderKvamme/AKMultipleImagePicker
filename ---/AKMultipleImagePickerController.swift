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
    private var doneButton = UIButton()
    
    // MARK: - Initializers

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    // MARK: - private methods
    
    private func setup() {
        // Self
        view.backgroundColor = .purple
        
        // doneButton
        doneButton = UIButton(type: .custom)
        doneButton.setTitle("BEKREFT", for: .normal)
        doneButton.setTitleColor(.black, for: .normal)
        doneButton.backgroundColor = .white
        doneButton.layer.cornerRadius = 20
        doneButton.addTarget(self, action: #selector(didTapDone), for: .touchUpInside)
        
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
        view.addSubview(doneButton)
        
        imagePickerCollectionView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(40)
            make.left.right.bottom.equalTo(view)
        }
        
        doneButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-40)
            make.right.equalToSuperview().offset(-40)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
    }
    
    @objc private func didTapDone() {
        print("done!")
        print("ended up with selected images: ", dataSourceAndDelegate.getSelectedImages())
    }
}

