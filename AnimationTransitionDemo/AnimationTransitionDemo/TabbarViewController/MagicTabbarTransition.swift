//
//  MagicTabbarTransition.swift
//  AnimationTransitionDemo
//
//  Created by junjie on 2019/8/29.
//  Copyright © 2019 junjie. All rights reserved.
//

import UIKit

class MagicTabbarTransition: NSObject, UIViewControllerAnimatedTransitioning {
    var direction: UIRectEdge?
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromView = transitionContext.view(forKey: .from)
        let toView = transitionContext.view(forKey: .to)
        
        let contentView = transitionContext.containerView
        contentView.addSubview(toView!)
        contentView.addSubview(fromView!)
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            if self.direction == UIRectEdge.right {
                fromView?.frame = CGRect(x: UIScreen.main.bounds.size.width, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
                toView?.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
            } else {
                fromView?.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
                toView?.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
            }
        }) { (result) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
    //方向
    func directionWithEdgeSide(edge: UIRectEdge) -> MagicTabbarTransition {
        direction = edge
        return self
    }

}
