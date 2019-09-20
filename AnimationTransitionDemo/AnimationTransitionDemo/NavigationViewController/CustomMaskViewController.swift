//
//  CustomMaskViewController.swift
//  AnimationTransitionDemo
//
//  Created by junjie on 2019/9/10.
//  Copyright © 2019 junjie. All rights reserved.
//

import UIKit

class CustomMaskViewController: UIViewController {
    var imageView: UIImageView?
    var currentView = UIView()
    var endUIBezierPath: UIBezierPath?
    var beignBezierPath: UIBezierPath?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let photoView = UIImageView(frame: self.view.frame)
        self.view.addSubview(photoView)
        photoView.image = UIImage.init(named: "green.jpg")
        let taper = UITapGestureRecognizer(target: self, action: #selector(clickTap(tap:)))
        photoView.isUserInteractionEnabled = true
        photoView.addGestureRecognizer(taper)
        
        
        imageView = UIImageView(frame: self.view.frame)
        self.view.addSubview(imageView!)
        imageView?.image = UIImage.init(named: "town.jpg")
        

        currentView.backgroundColor = .red
        currentView.frame = CGRect(x: 280, y: 150, width: 80, height: 80)
        currentView.layer.cornerRadius = 40
        currentView.layer.masksToBounds = true
        self.view.addSubview(currentView)
        imageView?.layer.mask = currentView.layer
        
        beignBezierPath = UIBezierPath(ovalIn: currentView.frame)
        
//        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 100, width: 150, height: 100), cornerRadius: 50)
//        let layer = CAShapeLayer()
//        layer.path = path.cgPath
//        layer.fillColor = UIColor.red.cgColor
//        self.view.layer.addSublayer(layer)
    }
    
    @objc func clickTap(tap: UITapGestureRecognizer) {
        self.navigationController?.pushViewController(NextViewController(), animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.delegate = self
    }

}

extension CustomMaskViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return CustomMaskTransiton()
        } else {
            return nil
        }
    }
}
