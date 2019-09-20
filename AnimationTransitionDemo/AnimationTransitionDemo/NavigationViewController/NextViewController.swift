//
//  NextViewController.swift
//  AnimationTransitionDemo
//
//  Created by junjie on 2019/9/4.
//  Copyright © 2019 junjie. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    var photoView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        self.navigationController?.delegate = self
        
        photoView.frame = self.view.frame
        self.view.addSubview(photoView)
        photoView.image = UIImage.init(named: "town.jpg")
    }
    
}

extension NextViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .pop {
            return CustomMaskPopTransition()
        }
        return nil
    }
}
