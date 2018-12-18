//
//  CameraViewController.swift
//  AKMultipleImagePicker
//
//  Created by Amia Macone on 18/12/2018.
//  Copyright © 2018 Amia Macone. All rights reserved.
//

import Foundation
import UIKit


class CameraViewController: UIViewController {
    
    // MARK: - Properties
    
    private var button = UIButton()
    
    // MARK: - Initializers
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        setup()
    }
    
    // MARK: - Methods
    
    @objc private func showImagePicker() {
        guard let containerViewController = (parent as? ContainerViewController) else {
            assertionFailure()
            return
        }
        
        let imagePicker = AKMultipleImagePickerController { (images) in
            print("SUCCESS would upload \(images)")
//            let cameraViewController = CameraViewController()
            print("tryna setActiveViewController to camera")
            containerViewController.setActiveViewController(self)
        }
        containerViewController.setActiveViewController(imagePicker)
    }
    
    private func setup() {
        // Button
        button.setTitle("Pick images", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(showImagePicker), for: .touchUpInside)
        
        view.addSubview(button)
        
        button.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
}

