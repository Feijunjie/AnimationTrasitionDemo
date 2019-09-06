//
//  MagicPushTransition.swift
//  AnimationTransitionDemo
//
//  Created by junjie on 2019/8/29.
//  Copyright © 2019 junjie. All rights reserved.
//

import UIKit
//动画控制器
class MagicPushTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from) as! ViewController
        let toVC = transitionContext.viewController(forKey: .to) as! DetailViewController
        let container = transitionContext.containerView
        
        let snapView = fromVC.selectCell?.photoView?.snapshotView(afterScreenUpdates: true)
        snapView?.frame = container.convert((fromVC.selectCell?.photoView!.frame)!, from: fromVC.selectCell)
        
        toVC.photoView?.isHidden = true
        
        container.addSubview(toVC.view)
        container.addSubview(snapView!)
        
        UIView.animate(withDuration: 0.5, animations: {
            snapView?.frame = toVC.photoView!.frame
        }) { (result) in
            snapView?.removeFromSuperview()
            toVC.photoView?.isHidden = false
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    

}
