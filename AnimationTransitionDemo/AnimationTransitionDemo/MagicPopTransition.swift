//
//  MagicPopTransition.swift
//  AnimationTransitionDemo
//
//  Created by junjie on 2019/8/29.
//  Copyright © 2019 junjie. All rights reserved.
//

import UIKit
//动画控制器
class MagicPopTransition: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from) as! DetailViewController
        let toVC = transitionContext.viewController(forKey: .to) as! ViewController
        
        let container = transitionContext.containerView
        
        let snapView = fromVC.photoView?.snapshotView(afterScreenUpdates: false)
        snapView?.frame = (fromVC.photoView?.frame)!
        
        toVC.selectCell?.photoView?.isHidden = true
        
        container.addSubview(toVC.view)
        container.addSubview(snapView!)
        
        UIView.animate(withDuration: 0.5, animations: {
            snapView?.frame = container.convert((toVC.selectCell?.photoView?.frame)!, from: toVC.selectCell)
        }) { (result) in
            snapView?.removeFromSuperview()
            toVC.selectCell?.photoView?.isHidden = false
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    

}
