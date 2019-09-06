//
//  AViewController.swift
//  AnimationTransitionDemo
//
//  Created by junjie on 2019/8/30.
//  Copyright © 2019 junjie. All rights reserved.
//

import UIKit

class AViewController: UIViewController {
    var photoView: UIImageView?
    var panTransiion: UIPercentDrivenInteractiveTransition?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        self.createUI()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        self.transitioningDelegate = self
//    }
    
    func createUI() {
        photoView = UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        self.view.addSubview(photoView!)
        photoView?.center = CGPoint(x: self.view.center.x, y: 200)
        photoView?.image = UIImage.init(named: "town.jpg")
        
        let button = UIButton(type: .system)
        self.view.addSubview(button)
        button.frame = CGRect(x: 100, y: 400, width: 150, height: 20)
        button.center = CGPoint(x: self.view.center.x, y: 400)
        button.setTitle("点击模态jump", for: .normal)
        button.addTarget(self, action: #selector(jumpVC(btn:)), for: .touchUpInside)
    }
    
    @objc func jumpVC(btn: UIButton) {
        let vc = BViewController()
//        vc.transitioningDelegate = self
//        panTransiion = vc.percentTranstion
        self.modalPresentationStyle  = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }

}
