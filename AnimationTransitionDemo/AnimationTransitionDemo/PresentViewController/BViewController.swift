//
//  BViewController.swift
//  AnimationTransitionDemo
//
//  Created by junjie on 2019/8/30.
//  Copyright © 2019 junjie. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
    var photoView: UIImageView?
    var percentTranstion: UIPercentDrivenInteractiveTransition?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        self.transitioningDelegate = self
        createUI()
    }
    
    func createUI() {
        photoView = UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        self.view.addSubview(photoView!)
        photoView?.center = CGPoint(x: self.view.center.x, y: 200)
        photoView?.image = UIImage.init(named: "town.jpg")
        
        let button = UIButton(type: .system)
        self.view.addSubview(button)
        button.frame = CGRect(x: 100, y: 400, width: 150, height: 20)
        button.center = CGPoint(x: self.view.center.x, y: 400)
        button.setTitle("点击dismiss返回", for: .normal)
        button.addTarget(self, action: #selector(jumpDismiss(btn:)), for: .touchUpInside)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panWithDown(tap:)))
        self.view.addGestureRecognizer(pan)
    }
    
    @objc func panWithDown(tap: UIPanGestureRecognizer) {
        let distance = tap.translation(in: self.view).y / 300
        if tap.state == .began {
            print("开始滑动")
            self.percentTranstion = UIPercentDrivenInteractiveTransition()
            //触发交互式动画
            self.dismiss(animated: true, completion: nil)
        } else if tap.state == .changed {
            self.percentTranstion?.update(distance)
            print("状态改变中")
        } else if tap.state == .ended || tap.state == .cancelled {
            if distance > 0.5 {
                self.percentTranstion?.finish()
                print("结束了")
            } else {
                self.percentTranstion?.cancel()
                print("取消了")
            }
            self.percentTranstion = nil
        }
    }
    
    @objc func jumpDismiss(btn: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        return .top
    }

}

extension BViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MagicPresentTransition().reloadWithPresent(isPresent: true)
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MagicPresentTransition().reloadWithPresent(isPresent: false)
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return percentTranstion
    }
}

