//
//  TableViewController.swift
//  SpiltDataSource
//
//  Created by LoyaltyWu on 17/7/11.
//  Copyright © 2017年 LoyaltyWu. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    func printPointer(ptr:UnsafeMutablePointer<TableViewController>) {
        // 用来打印地址看是否是同一个对象的。
        print("-2- UnsafeMutablePointer:\(ptr)")
        print("-2- pointee:\(ptr.pointee)")
    }
    
    override func viewDidLoad() {
        var j = self
        printPointer(ptr:&j)
        super.viewDidLoad()
        let right1 = UIBarButtonItem(title: "add", style: .plain, target: self, action: #selector(self.add))
        let right2 = self.editButtonItem
        self.navigationItem.rightBarButtonItems = [right1,right2]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func add(){
        // some Module Data is Added.
        // Module tell Controller to reload.
//        let con:ChangeModuleViewController = ChangeModuleViewController()
        let con = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChangeModuleViewController")
        self.navigationController?.pushViewController(con, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
