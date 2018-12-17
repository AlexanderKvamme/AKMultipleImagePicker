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
    private var checkmarkView = UIImageView()
    
    // MARK: - Overrides
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                checkmarkView.alpha = 1
            } else {
                checkmarkView.alpha = 0
            }
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
        // checkmark
        checkmarkView.image = UIImage(named: "baseline_check_circle_white_48pt")?.withRenderingMode(.alwaysTemplate)
        checkmarkView.tintColor = .green
        checkmarkView.alpha = 0
        
        // AddSubviewsAndConstraints
        contentView.addSubview(imageView)
        contentView.addSubview(checkmarkView)
        
        imageView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
        
        checkmarkView.snp.makeConstraints { (make) in
            let diameter: CGFloat = 40
            
            make.height.width.equalTo(diameter)
            make.center.equalToSuperview()
        }
    }
    
    // MARK: Public methods
    
    func update(with image: UIImage) {
        imageView.image = image
    }
}

