//
//  DetailViewController.swift
//  AnimationTransitionDemo
//
//  Created by junjie on 2019/8/29.
//  Copyright © 2019 junjie. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var photoView: UIImageView?
    var photoImage: UIImage?
    var percentTranstion: UIPercentDrivenInteractiveTransition?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "详情页"
        self.createUI()
        self.navigationController?.delegate = self
    }
    
    func createUI() {
        photoView = UIImageView(frame: CGRect(x: 100, y: 100, width: 180, height: 180))
        self.view.addSubview(photoView!)
        photoView?.center = CGPoint(x: self.view.center.x, y: 200)
        photoView?.image = photoImage ?? UIImage.init(named: "town.jpg")
        
        let edgePageGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(edgeAction(sender:)))
        edgePageGesture.edges = .left
        self.view.addGestureRecognizer(edgePageGesture)
    }
    
    @objc func edgeAction(sender: UIScreenEdgePanGestureRecognizer) {
        //计算手指滑动的距离
        
        //计算手势驱动占屏幕的百分比
        let distance = sender.translation(in: sender.view).x / self.view.bounds.size.width
        if sender.state == .began {
            print("开始滑动")
            self.percentTranstion = UIPercentDrivenInteractiveTransition()
            self.navigationController?.popViewController(animated: true)
        } else if sender.state == .changed {
            self.percentTranstion?.update(distance)
            print("状态改变中")
        } else if sender.state == .ended || sender.state == .cancelled {
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

}

extension DetailViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .pop {
            return MagicPopTransition()
        } else {
            return nil
        }
    }
    
    
    //交互式转场
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if animationController is MagicPopTransition {
            return percentTranstion
        }
        return nil
    }
    
    
}
