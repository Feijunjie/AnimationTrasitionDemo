//
//  OtherViewController.swift
//  AnimationTransitionDemo
//
//  Created by junjie on 2019/8/30.
//  Copyright © 2019 junjie. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController {
    var photoView: UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        createUI()
    }
    
    func createUI() {
        photoView = UIImageView(frame: CGRect(x: 100, y: 100, width: 180, height: 180))
        self.view.addSubview(photoView!)
        photoView?.center = CGPoint(x: self.view.center.x, y: 200)
        photoView?.image = UIImage.init(named: "green.jpg")
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
