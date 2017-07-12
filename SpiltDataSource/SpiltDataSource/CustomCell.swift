//
//  CustomCell.swift
//  SpiltDataSource
//
//  Created by LoyaltyWu on 17/7/11.
//  Copyright © 2017年 LoyaltyWu. All rights reserved.
//

import UIKit

class CustomCell :UITableViewCell{
    func configureForCell(item:ModuleData!){
        self.imageView?.image = UIImage(named: "sample.png")
        self.textLabel?.text = String(item.x)
        let processedX:Int = item.y
        self.detailTextLabel?.text = String(processedX)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
