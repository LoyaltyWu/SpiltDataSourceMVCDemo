//
//  CustomDataSource.swift
//  SpiltDataSource
//
//  Created by LoyaltyWu on 17/7/11.
//  Copyright © 2017年 LoyaltyWu. All rights reserved.
//

import Foundation
import UIKit

// KVO Observer
class CustomDataSource:NSObject,UITableViewDataSource {
    var cellData:NSObject?
    var cellIdentifier:String?
    var configureCell:((AnyObject,AnyObject)->())?
    private var myContext = 0
    init(cellIdentifier:String,configureCell:@escaping ((AnyObject,AnyObject)->())){
        super.init()
        print("we've got here.")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.cellData = appDelegate.SwallowedArray
        appDelegate.SwallowedArray.addObserver(self, forKeyPath: "instance", options: .new, context: &myContext)
        self.cellIdentifier = cellIdentifier
        self.configureCell = configureCell
    }
    // KVO注意：必须为dynamic，同时该被监听的对象必须可表示为OC的形式也就是继承自NSObject。
    // 注意监听和被监听者的生命周期
    // 最后记得移除监听者，防止内存泄漏
    // http://www.cnblogs.com/zxh-iOS/p/5185258.html KVO注意事项
    // KVO
    deinit {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.cellData = appDelegate.SwallowedArray
        appDelegate.SwallowedArray.removeObserver(self, forKeyPath: "instance")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (context == &myContext){
            print("have Changed")
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.tableViewController?.tableView.reloadData()
        }
    }
    // KVO end
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let inside = cellData as! ModuleSwallowedArray
        return inside.instance.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let s = UIApplication.shared.delegate as! AppDelegate
            s.SwallowedArray.instance.remove(at: indexPath.row)
        }else if editingStyle == .insert{
            
        }
        // tableView.reloadData()
        // reload操作不应该放在这里
        // 而应该通过KVO进行实现。
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellID", for: indexPath)
        print("row\(indexPath.row)")
        print("count\((cellData as! ModuleSwallowedArray).instance.count)")
        let item = (cellData as! ModuleSwallowedArray).instance[indexPath.row]
        // 上面这一句有待斟酌。!!!!!!!!!!!!
        configureCell!(cell,item)
        return cell
    }
}
