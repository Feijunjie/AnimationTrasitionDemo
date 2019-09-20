//
//  CustomMaskTransiton.swift
//  AnimationTransitionDemo
//
//  Created by junjie on 2019/9/10.
//  Copyright © 2019 junjie. All rights reserved.
//

import UIKit

class CustomMaskTransiton: NSObject, UIViewControllerAnimatedTransitioning {
    var transition: UIViewControllerContextTransitioning?
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        transition = transitionContext
        let fromVC = transitionContext.viewController(forKey: .from) as! CustomMaskViewController
        let toVC = transitionContext.viewController(forKey: .to) as! NextViewController
        let containerView = transitionContext.containerView
        containerView.addSubview(toVC.view)
  
        //设置遮罩
        let buttonFrame = fromVC.currentView.frame
        let startPath = UIBezierPath(roundedRect: buttonFrame, cornerRadius: 40)
        let endPath = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x:-230, y: 0), size: CGSize(width: UIScreen.main.bounds.height, height: UIScreen.main.bounds.height+100)), cornerRadius: UIScreen.main.bounds.height/2)
        
        let shapeLayer = CAShapeLayer()
        toVC.view.layer.mask = shapeLayer
        //防最后屏闪
        shapeLayer.path = endPath.cgPath
        
        
        let basicAnimation = CABasicAnimation(keyPath: "path")
        basicAnimation.fromValue = startPath.cgPath
        basicAnimation.toValue = endPath.cgPath
        basicAnimation.duration = self.transitionDuration(using: transitionContext)
        basicAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        basicAnimation.delegate = self
        
        shapeLayer.add(basicAnimation, forKey: nil)
    }
    

}

extension CustomMaskTransiton: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        let toVC = transition?.viewController(forKey: .to) as! NextViewController
        toVC.view.layer.mask = nil
        transition?.completeTransition(!transition!.transitionWasCancelled)
    }
}
