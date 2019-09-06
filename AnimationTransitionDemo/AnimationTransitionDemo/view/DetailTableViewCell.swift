//
//  DetailTableViewCell.swift
//  AnimationTransitionDemo
//
//  Created by junjie on 2019/8/29.
//  Copyright © 2019 junjie. All rights reserved.
//

import UIKit
class DetailTableViewCell: UITableViewCell {
    var photoView: UIImageView?
    var titlelabel: UILabel?
    var detailLabel: UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        photoView = UIImageView(frame: CGRect(x: 10, y: 10, width: 90, height: 90))
        self.contentView.addSubview(photoView!)
        photoView?.backgroundColor = .yellow
        
        titlelabel = UILabel(frame: CGRect(x: 110, y: 10, width: 280, height: 15))
        self.contentView.addSubview(titlelabel!)
        titlelabel?.textAlignment = .left
        titlelabel?.font = UIFont.systemFont(ofSize: 14)
        titlelabel?.text = "标题"
        
        detailLabel = UILabel(frame: CGRect(x: 110, y: 50, width: 280, height: 40))
        self.contentView.addSubview(detailLabel!)
        detailLabel?.textAlignment = .left
        detailLabel?.font = UIFont.systemFont(ofSize: 13)
        detailLabel?.text = "详情"
    }
    
    func reloadUIWithIndexPath(indexpath: IndexPath) {
        if indexpath.row % 2 == 0 {
            photoView?.image = UIImage.init(named: "green.jpg")
            titlelabel?.text = "绿色天空"
            detailLabel?.text = "这是一条关于绿色天空的详情解说----"
        } else {
            photoView?.image = UIImage.init(named: "town.jpg")
            titlelabel?.text = "小镇风情"
            detailLabel?.text = "这是一条关于小镇风情地理面貌的描述----"
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
