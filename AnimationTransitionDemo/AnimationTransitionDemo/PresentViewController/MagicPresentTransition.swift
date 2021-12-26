//
//  MagicPresentTransition.swift
//  AnimationTransitionDemo
//
//  Created by junjie on 2019/8/30.
//  Copyright © 2019 junjie. All rights reserved.
//

import UIKit

class MagicPresentTransition: NSObject, UIViewControllerAnimatedTransitioning {
    var ISPresent = true
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        var fromVC: UIViewController
        var toVC: UIViewController
        let container = transitionContext.containerView
        let backView = UIView(frame: container.frame)
        backView.backgroundColor = .black
        backView.alpha = 0.35
        if ISPresent {
            toVC = transitionContext.viewController(forKey: .to)!
            
            let toView = toVC.view
            toView?.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            container.addSubview(backView)
            container.addSubview(toView!)
            
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
                toView?.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height/3, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height/3 * 2)
            }) { (result) in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        } else {
            fromVC = transitionContext.viewController(forKey: .from) as! BViewController
            
            let fromView = fromVC.view
            fromView?.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height/3, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height/3*2)
        
            container.addSubview(fromView!)
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
                fromView?.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: 0)
            }) { (result) in
                if !transitionContext.transitionWasCancelled {
                    backView.removeFromSuperview()
                }
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        }
        
    }
    
    func reloadWithPresent(isPresent: Bool) -> MagicPresentTransition {
        ISPresent = isPresent
        return self
    }

}
