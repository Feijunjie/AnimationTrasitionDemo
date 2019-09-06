//
//  MainViewController.swift
//  AnimationTransitionDemo
//
//  Created by junjie on 2019/8/29.
//  Copyright © 2019 junjie. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    var beforIndex = 0
    var chooseIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.delegate = self
        
        let vcOne = ViewController()
        vcOne.title = "列表页"
        
        let vcTwo = DetailViewController()
        vcTwo.title = "详情页"
        
        let vcThree = OtherViewController()
        vcThree.title = "绿色"

        let navOne = UINavigationController(rootViewController: vcOne)
        let navTwo = UINavigationController(rootViewController: vcTwo)
        let navThree = UINavigationController(rootViewController: vcThree)
        self.addChild(navOne)
        self.addChild(navTwo)
        self.addChild(navThree)
    }

}

extension MainViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let tabbarControllers = tabBarController.viewControllers
        if tabbarControllers?.firstIndex(of: toVC) ?? 0 > tabbarControllers?.firstIndex(of: fromVC) ?? 0{
            return MagicTabbarTransition().directionWithEdgeSide(edge: .left)
        } else {
            return MagicTabbarTransition().directionWithEdgeSide(edge: .right)
        }
    }
}
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        chooseIndex = tabBar.items?.firstIndex(of: item) ?? 0
//        beforIndex = self.selectedIndex
//
//        let transition = CATransition()
//        transition.type = .moveIn
//        transition.subtype = chooseIndex > beforIndex ? .fromRight : .fromLeft
//        self.view.layer.add(transition, forKey: nil)
//
//
//    }
