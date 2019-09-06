//
//  ViewController.swift
//  AnimationTransitionDemo
//
//  Created by junjie on 2019/8/29.
//  Copyright © 2019 junjie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tableView: UITableView?
    var selectCell: DetailTableViewCell?
    let tableViewID = "uitableViewCellID"
    let DetailTableViewCellID = "DetailTableViewCellID"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "列表页"
        tableView = UITableView(frame: self.view.frame)
        self.view.addSubview(tableView!)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.separatorStyle = .none
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: tableViewID)
        tableView?.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCellID)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.delegate = self
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCellID, for: indexPath) as! DetailTableViewCell
        cell.reloadUIWithIndexPath(indexpath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectCell = tableView.cellForRow(at: indexPath) as? DetailTableViewCell
        let vc = DetailViewController()
        vc.photoImage = [UIImage.init(named: "green.jpg"), UIImage.init(named: "town.jpg")][indexPath.row % 2]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return MagicPushTransition()
        } else {
            return nil
        }
    }
}

