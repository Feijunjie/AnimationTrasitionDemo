//
//  CustomMaskPopTransition.swift
//  AnimationTransitionDemo
//
//  Created by junjie on 2019/9/10.
//  Copyright © 2019 junjie. All rights reserved.
//

import UIKit

class CustomMaskPopTransition: NSObject, UIViewControllerAnimatedTransitioning {
    var transition: UIViewControllerContextTransitioning?
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //关键帧动画
        transition = transitionContext
        let fromVC = transitionContext.viewController(forKey: .from) as! NextViewController
        let toVC = transitionContext.viewController(forKey: .to) as! CustomMaskViewController
        let containerView = transitionContext.containerView
        containerView.addSubview(toVC.view)
        containerView.addSubview(fromVC.view)

        let buttonFrame = toVC.currentView.frame
        let beginPath = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x:-230, y: 0), size: CGSize(width: UIScreen.main.bounds.height, height: UIScreen.main.bounds.height+100)), cornerRadius: UIScreen.main.bounds.height/2)
        let endPath = UIBezierPath(roundedRect: buttonFrame, cornerRadius: 40)

        let shapeLayer = CAShapeLayer()
        fromVC.view.layer.mask = shapeLayer
        shapeLayer.path = endPath.cgPath

        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = beginPath.cgPath
        animation.toValue = endPath.cgPath
        animation.duration = self.transitionDuration(using: transitionContext)
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.delegate = self
        shapeLayer.add(animation, forKey: nil)
        
        
    }
    

}

extension CustomMaskPopTransition: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        let fromVC = transition!.viewController(forKey: .from) as! NextViewController
        fromVC.view.layer.mask = nil
        transition?.completeTransition(!transition!.transitionWasCancelled)
    }
}

