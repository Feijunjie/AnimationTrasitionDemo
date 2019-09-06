//
//  CurrentViewController.swift
//  AnimationTransitionDemo
//
//  Created by junjie on 2019/9/4.
//  Copyright © 2019 junjie. All rights reserved.
//

import UIKit

class CurrentViewController: UIViewController {
    var clickBtn: UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.navigationController?.delegate = self
        
        clickBtn = UIButton(type: .custom)
        self.view.addSubview(clickBtn!)
        clickBtn?.frame = CGRect(x: 200, y: 120, width: 100, height: 100)
        clickBtn?.backgroundColor = .yellow
        clickBtn?.layer.cornerRadius = 50
        clickBtn?.layer.masksToBounds = true
        clickBtn?.addTarget(self, action: #selector(clickTap(btn:)), for: .touchUpInside)
    }
    
    @objc func clickTap(btn: UIButton) {
//        let transition = CATransition()
//        transition.type = .init(rawValue: "cameraIrisHollowClose")
//        transition.subtype = .fromTop
//        transition.duration = 2
//        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(NextViewController(), animated: true)
    }

}

extension CurrentViewController: UINavigationControllerDelegate {
//    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        
//    }
}
