//
//  AKImagePickerCell.swift
//  AKMultipleImagePicker
//
//  Created by Amia Macone on 17/12/2018.
//  Copyright © 2018 Amia Macone. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


final class AKImagePickerCell: UICollectionViewCell {
    
    // MARK: - Properties

    static let reuseIdentifier = "AKCELL"
    private var imageView = UIImageView()
    
    // MARK: - Overrides
    
    override var isSelected: Bool {
        didSet {
            print("I was tapped! - i am now: ", self.isSelected)
        }
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    // MARK: - Private methods
    
    private func setup() {
        imageView.backgroundColor = .green  
        
        // AddSubviewsAndConstraints
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    // MARK: Public methods
    
    func update(with image: UIImage) {
        imageView.image = image
    }
}

