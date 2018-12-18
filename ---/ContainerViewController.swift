//
//  ContainerViewController.swift
//  AKMultipleImagePicker
//
//  Created by Amia Macone on 18/12/2018.
//  Copyright © 2018 Amia Macone. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


final class ContainerViewController: UIViewController {
    
    // MARK: - Properties
    
    private var activeViewController: UIViewController?
    
    // MARK: - Life Cycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setActiveViewController(CameraViewController())
    }
    
    // MARK: - Public methods
    
    func setActiveViewController(_ vc: UIViewController) {
        // Remove active controller and its views
        activeViewController?.view.removeFromSuperview()
        activeViewController?.removeFromParent()
        
        // Replace with new viewController
        activeViewController = vc
        view.addSubview(vc.view)
        addChild(vc)
    }
}

